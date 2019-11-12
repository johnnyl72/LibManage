class PosController < ApplicationController
  before_action :authenticate_user!, only: [:shelving, :returns, :check_out, :fees_submit]
  before_action :authorize_admin, only: [:shelving, :returns, :check_out, :fees_submit]

  def fees
    @users = User.where('debt > ?', 0).order(updated_at: :desc).limit(10)
  end

  def fees_submit
    params.require([:user_id, :payment_amount])
    user = User.find(params[:user_id])
    amount = params[:payment_amount].to_d
    if user.debt < amount
      redirect_to fees_path, notice: "Failure: Payment greater than user debt."
    end
    user.decrement!(:debt, amount)
    redirect_to fees_path, notice: "Updated user debt to #{user.debt}"
  end

  def shelving
  end

  # POST
  def shelving_submit
    book_ids = params.require(:books)
    books = BookItem.where(id: book_ids.split)
    books.update_all(status: 'available')
    redirect_to shelving_path, notice: "Updated bookitems: #{books.ids}"
  end

  def returns
  end

  #POST
  def returns_submit
    # TODO: Tell users the books were returned
    book_ids = params.require(:books)
    books = BookItem.where(id: book_ids.split)
    books.update_all(status: 'shelving')
    Loan.destroy_by(book_item_id: books.ids)
    redirect_to shelving_path, notice: "Updated bookitems: #{books.ids}"
  end

  def check_out
  end

  #POST
  def check_out_submit
    required = params.require([:user, :books])
    books = required[1].split
    errors = true
    books.each do |book|
      bookitem = BookItem.find(book)
      loan = Loan.new(
        book_item_id: book,
        user_id: required[0],
        due_date: Time.now + 2.weeks)
      if loan.save
        bookitem.status = 'loaned'
        bookitem.save
      else
        # make list of loans that failed
        errors = false
      end
    end
    redirect_to checkout_path, notice: "Created loans #{'un' if errors}successfully!"
  end
end

class PosController < ApplicationController
  def pos
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

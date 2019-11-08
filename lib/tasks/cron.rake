namespace :cron do
  desc "UPDATE_FEES"
  task update_fees: :environment do
    puts "Updating late fees..."
    today = Time.current.beginning_of_day
    loans = Loan.where('due_date < ?', today).includes(:user)
    loans.each do |loan|
      loan.user.increment!(:debt, 1.00)
      loan.update_attribute(:due_date, today)
    end
    puts "Done."
  end
end

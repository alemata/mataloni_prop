class Expense < ActiveRecord::Base
  belongs_to :building

  def month_year
    for_month.strftime("%m/%Y")
  end
end

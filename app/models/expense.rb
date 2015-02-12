class Expense < ActiveRecord::Base
  belongs_to :building
  mount_uploader :file, FileUploader

  validates :file, presence: true

  def month_year
    for_month.strftime("%m/%Y")
  end
end

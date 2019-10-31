class DailyActivityCounter < ApplicationRecord
  belongs_to :activist
  before_save :set_year_and_year_month

  private

  def set_year_and_year_month
    self.year = date.year
    self.year_month = date.strftime('%Y-%m')
  end
end

class AddYearMonthToDailyActivityCounter < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_activity_counters, :year_month, :string
    add_column :daily_activity_counters, :year, :integer

    add_index :daily_activity_counters, [:activist_id, :date]
    add_index :daily_activity_counters, [:activist_id, :year_month]
    add_index :daily_activity_counters, [:activist_id, :year]
  end
end

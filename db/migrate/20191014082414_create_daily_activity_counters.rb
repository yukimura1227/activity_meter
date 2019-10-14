class CreateDailyActivityCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_activity_counters do |t|
      t.string :type
      t.integer :activist_id
      t.date :date
      t.integer :count

      t.timestamps
    end
  end
end

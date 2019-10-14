class CreateActivists < ActiveRecord::Migration[5.2]
  def change
    create_table :activists do |t|
      t.string :uuid

      t.timestamps
    end
  end
end

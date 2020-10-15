class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :w_day_id, null: false
      t.integer :from_time_id, null: false
      t.integer :to_time_id, null: false
      t.string  :location

      t.timestamps
    end
  end
end
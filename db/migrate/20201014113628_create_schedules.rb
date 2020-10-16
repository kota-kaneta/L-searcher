class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :from_time_sun
      t.integer :to_time_sun
      t.integer :from_time_mon
      t.integer :to_time_mon
      t.integer :from_time_tue
      t.integer :to_time_tue
      t.integer :from_time_wed
      t.integer :to_time_wed
      t.integer :from_time_thu
      t.integer :to_time_thu
      t.integer :from_time_fri
      t.integer :to_time_fri
      t.integer :from_time_sat
      t.integer :to_time_sat
      t.string  :location
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
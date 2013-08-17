class CreateDailies < ActiveRecord::Migration
  def change
    create_table :dailies do |t|
      t.date :report_for
      t.decimal :am_weight
      t.integer :am_systolic
      t.integer :am_diastolic
      t.integer :am_pulse
      t.decimal :am_temp
      t.time :am_meds
      t.time :miralax
      t.time :lunch_meds
      t.boolean :nap
      t.time :pm_meds
      t.integer :pm_systolic
      t.integer :pm_diastolic
      t.integer :pm_pulse
      t.time :bedtime_meds
      t.time :bedtime
      t.integer :user_id

      t.timestamps
    end
    add_index :dailies, [:user_id, :report_for]
  end
end

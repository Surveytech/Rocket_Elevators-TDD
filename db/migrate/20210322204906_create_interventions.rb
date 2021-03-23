class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author_id
      t.integer :employee_id
      t.integer :building_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.datetime :interv_start
      t.datetime :interv_end
      t.string :result
      t.string :report
      t.string :status

      t.timestamps
    end
  end
end

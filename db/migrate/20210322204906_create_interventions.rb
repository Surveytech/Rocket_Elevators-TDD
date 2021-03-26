class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author_id
      t.references :customer, null:false, foreign_key: true
      t.references :building, null:false, foreign_key: true
      t.references :battery, foreign_key: true
      t.references :column, foreign_key: true
      t.references :elevator, foreign_key: true
      t.references :employee, foreign_key: true
      t.datetime :intervention_start, null:true
      t.datetime :intervention_end, null:true
      t.string :result, default: "Incomplete"
      t.string :report
      t.string :status, default: "Pending"

      t.timestamps
    end
  end
end

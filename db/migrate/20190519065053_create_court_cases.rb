class CreateCourtCases < ActiveRecord::Migration[5.2]
  def change
    create_table :court_cases do |t|
      t.references :user

      t.string :case_name
      t.string :case_number
      t.string :case_state
      t.string :case_type      
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :court_cases, [:user_id, :status]
    add_index :court_cases, [:user_id, :case_name]
  end
end

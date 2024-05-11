class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.boolean :centralized_task_management
      t.boolean :monitoring_activity
      t.boolean :generating_reports
      t.boolean :data_storage
      t.boolean :keeping_records
      t.string :other
      t.string :company
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end

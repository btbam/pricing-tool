class CreateImporterRuns < ActiveRecord::Migration
  def change
    create_table :importer_runs do |t|
      t.text :error_trace
      t.timestamp :started_at
      t.timestamp :completed_at
      t.integer :duration
      t.string :importer_task
      t.string :importer_version
      t.integer :records_created
      t.integer :records_updated
      t.json :validation_errors

      t.timestamps
    end
    add_index :importer_runs, :started_at
    add_index :importer_runs, :completed_at
    add_index :importer_runs, :importer_task
    add_index :importer_runs, :importer_version
  end
end

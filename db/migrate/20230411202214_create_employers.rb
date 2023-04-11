class CreateEmployers < ActiveRecord::Migration[6.0]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :location
      t.integer :jobs_count

      t.timestamps
    end
  end
end

class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.integer :employer_id
      t.date :start_date
      t.date :end_date
      t.text :description
      t.text :skills

      t.timestamps
    end
  end
end

class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.integer :resume_id
      t.integer :job_id
      t.string :description
      t.integer :display_order

      t.timestamps
    end
  end
end

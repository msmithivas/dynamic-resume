class CreateResumes < ActiveRecord::Migration[6.0]
  def change
    create_table :resumes do |t|
      t.string :name
      t.integer :user_id
      t.boolean :display
      t.text :objective

      t.timestamps
    end
  end
end

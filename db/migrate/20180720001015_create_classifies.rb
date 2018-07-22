class CreateClassifies < ActiveRecord::Migration[5.1]
  def change
    create_table :classifies do |t|
      t.string :model_name
      t.text :inputtext
      t.string :pred
      t.integer :conf


      t.timestamps
    end
  end
end

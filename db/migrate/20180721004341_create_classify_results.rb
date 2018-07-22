class CreateClassifyResults < ActiveRecord::Migration[5.1]
  def change
    create_table :classify_results do |t|
      t.string :modelname
      t.text :inputtext
      t.string :pred
      t.integer :conf

      t.timestamps
    end
  end
end

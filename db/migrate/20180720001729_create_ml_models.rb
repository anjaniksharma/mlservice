class CreateMlModels < ActiveRecord::Migration[5.1]
  def change
    create_table :ml_models do |t|
      t.string :name
      t.integer :port

      t.timestamps
    end
  end
end

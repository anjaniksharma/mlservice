class CreateFilejobs < ActiveRecord::Migration[5.1]
  def change
    create_table :filejobs do |t|
      t.string :name
      t.string :modelname

      t.timestamps
    end
  end
end

class CreateNpdIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :npd_industries do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end

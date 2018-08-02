class AddFileuriToFilejob < ActiveRecord::Migration[5.1]
  def change
    add_column :filejobs, :fileuri, :string
  end
end

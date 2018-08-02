class AddOrigfilenameToFilejob < ActiveRecord::Migration[5.1]
  def change
    add_column :filejobs, :origfilename, :string
  end
end

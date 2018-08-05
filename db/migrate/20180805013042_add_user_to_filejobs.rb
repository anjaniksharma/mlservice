class AddUserToFilejobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :filejobs, :user, foreign_key: true
  end

end

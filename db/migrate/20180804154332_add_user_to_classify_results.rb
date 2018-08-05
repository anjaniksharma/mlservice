class AddUserToClassifyResults < ActiveRecord::Migration[5.1]
  def change
    add_reference :classify_results, :user, foreign_key: true
  end
end

class ChangeClassifyresultConfToFloat < ActiveRecord::Migration[5.1]
  def change
  	change_column :classify_results , :conf, :float
  end

end

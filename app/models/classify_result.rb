class ClassifyResult < ApplicationRecord
	#attr_accessor :modelname, :inputtext, :pred, :conf
	default_scope -> { order(created_at: :desc) }
    def self.to_csv
    	CSV.generate do |csv|
    		csv << column_names
      		all.each do |classify_result|
        		csv << classify_result.attributes.values_at(*column_names)
            end
        end
    end

end

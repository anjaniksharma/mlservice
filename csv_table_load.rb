require 'csv'    

def load_models(filename, tablename)
  CSV.foreach(filename, :headers => true) do |row|
  tablename.create!(row.to_h)
   end
 end

#load_models("ml_models_load_file.csv", MlModel)
#load_models("industry_name_load_file.csv", NpdIndustry)
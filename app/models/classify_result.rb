class ClassifyResult < ApplicationRecord

	#attr_accessor :modelname, :inputtext, :pred, :conf
	validates :inputtext, presence: true, length: { minimum: 1 }
	before_save  :get_model_name_and_port, :tcp_get_respose, :upcase_inputtext
	attr_accessor :port, :model_id
	
	default_scope -> { order(created_at: :desc) }
    def self.to_csv
    	CSV.generate do |csv|
    		csv << column_names
      		all.each do |classify_result|
        		csv << classify_result.attributes.values_at(*column_names)
            end
        end
    end



private
    
	def tcp_get_respose()
		
		streamSock = TCPSocket.new( "lpwaidqu04", self.port )  
		streamSock.puts "12345678901234567890|" +inputtext.upcase
		outputtext = streamSock.recv(512)
		#outputtext = "|1070238717|99.010~"
		lst = outputtext.split("~")[0].split("|")
		self.pred = get_alpha_from_code(lst[1])
		self.conf = lst[2]
 		
 	end

 	def get_model_name_and_port()
 		model_and_port = MlModel.find_by(:id => model_id)
 		self.modelname = model_and_port[:name] 
 		self.port = model_and_port[:port] 
 	end

  	
  	def get_alpha_from_code(code)
  		return NpdIndustry.find_by(:code => code).name
  	end

  	def upcase_inputtext()
  		self.inputtext = inputtext.upcase
  	end


end

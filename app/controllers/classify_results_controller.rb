class ClassifyResultsController < ApplicationController

  def new
  	@classify_results = ClassifyResult.new
  	@classify_results = ClassifyResult.paginate(page: params[:page])
  end

  def index
  	@classify_results = ClassifyResult.paginate(page: params[:page])
  	
    respond_to do |format|
      format.html 
      format.csv { send_data @classify_results.to_csv }
      format.xls 
    end
  end

  def destroy
  	ClassifyResult.find(params[:id]).destroy
  	redirect_to results_url	
  end

  def create 
  	#@classify_result = ClassifyResult.new
  	#inp = params[:classify_result][:inputtext].upcase
  	#inputtext="12345678901234567890|" + inp
  	#rec = MlModel.find(params[:classify_result][:modelname])
  	#port = rec[:port]
  	#model_name = rec[:name]
  	#outputtext = tcp_get_respose(inputtext,port)
  	#lst = outputtext.split("~")[0].split("|")
  	#industry = NpdIndustry.find_by(:code => lst[1]).name
    #flash.now[:info] = model_name +  ":"  + inp
    #flash.now[:warning] = "Industry -> " + industry +"           "+ "Confidence -> " + lst[2] 
    #res_param = {modelname: model_name, inputtext: inp, pred:industry, conf: lst[2]}
    
    @res = ClassifyResult.new(classify_params)
    
    
    if not @res.save
    	flash.now[:info] = @res.errors.full_messages
    end
    #@classify_results = ClassifyResult.new
    if not logged_in?
    flash.now[:info] =    "Model Name ---->["  + @res[:modelname] + "]------>Input Text---->["  + @res[:inputtext] + "]"
    flash.now[:warning] = "Industry ------>["  + @res[:pred] + "]------Confidence ---->[" + @res[:conf].to_s + "]"
    end

    render 'new'
    #redirect_to classifytext_url
	
  end
private
      def classify_params
          params.require(:classify_result).permit(:model_id, :inputtext)
      end

  
  
end

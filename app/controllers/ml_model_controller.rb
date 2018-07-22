class MlModelController < ApplicationController
  def new
  	#@mlmodels = MlModel.all.pluck(:name, :id)
  end

  def show
  	@results = ClassifyResult.paginate(page: params[:page])
  end

  def create 
  	inp = params[:mlmodel][:inputtext].upcase
  	inputtext="12345678901234567890|" + inp
  	rec = MlModel.find(params[:mlmodel][:mdls])
  	port = rec[:port]
  	model_name = rec[:name]
  	outputtext = tcp_get_respose(inputtext,port)
  	lst = outputtext.split("~")[0].split("|")
  	industry = NpdIndustry.find_by(:code => lst[1]).name
    flash.now[:info] = model_name +  ":"  + inp
    flash.now[:warning] = "Industry -> " + industry +"           "+ "Confidence -> " + lst[2] 
    res_param = {modelname: model_name, inputtext: inp, pred:industry, conf: lst[2]}
    @res = ClassifyResult.new(res_param)
    @res.save
  
    render 'new'
  end

  private

  def tcp_get_respose(inputstr,port)
  #streamSock = TCPSocket.new( "lpwaidqu04", port )  
  #streamSock.puts inputstr
  #return streamSock.recv(512)
  return "|1070238717|99.010~"
end
 
end

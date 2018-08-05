class ClassifyResultsController < ApplicationController
before_action -> { flash.now[:notice] = flash[:notice].html_safe if flash[:html_safe] && flash[:notice] }
  def new
  	@classify_result ||= ClassifyResult.new
  	#@classify_results = ClassifyResult.paginate(page: params[:page])
  end

  def index
  	@classify_results = current_user.classify_results.paginate(page: params[:page])
  	
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
  	
    @res = current_user.classify_results.build(classify_params)
    
    if not @res.save
      flash[:info] = @res.errors.full_messages
      render 'new'
    else
      redirect_to text_path
    end
    
    
    if not logged_in?
    redirect_to text_path, notice: "
                                  <div><b>Model Name:</b>&nbsp&nbsp&nbsp#{@res[:modelname]}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Input Text:</b>&nbsp&nbsp&nbsp#{@res[:inputtext]}</div>
                                  <div><b>Industry</b>:&nbsp&nbsp&nbsp#{@res[:pred]}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>Confidence:</b>&nbsp&nbsp&nbsp#{@res[:conf]}</div>
                                  ",
    flash: { html_safe: true }
    
    end
  end
private
      def classify_params
          params.require(:classify_result).permit(:model_id, :inputtext)
      end

  
  
end

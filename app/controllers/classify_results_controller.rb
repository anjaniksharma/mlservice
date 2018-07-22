class ClassifyResultsController < ApplicationController
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
  	redirect_to show_url	
  end
end

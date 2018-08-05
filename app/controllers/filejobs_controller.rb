class FilejobsController < ApplicationController
  def index
  	@filejobs = Filejob.paginate(page: params[:page])
  	
  end

  def new
  	@filejob = current_user.filejobs.new
  end

  def create
    

    if params[:filejob][:inputfile]
      FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))
 
      ext = File.extname(params[:filejob][:inputfile].original_filename)
      file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
      path = Rails.root.join("public/uploads/files/", file_name)
 
      File.open(path, "wb") {|f| f.write(params[:filejob][:inputfile].read)}
      params[:filejob][:fileuri] = path
      params[:filejob][:origfilename] = params[:filejob][:inputfile].original_filename
      @filejob = current_user.filejobs.new(filejob_params)
  end

    if @filejob.save
       flash.now[:info] = "The Job #{@filejob.name} has been Created."
       
      redirect_to filejob_path
    else
      render "new"
    end
  end

  def destroy
  	Filejobs.find(params[:id]).destroy
  	redirect_to filejob_path
  end

  

  private 
  		def filejob_params

		    params.require(:filejob).permit(:name,:modelname, :origfilename, :fileuri)
		end
end

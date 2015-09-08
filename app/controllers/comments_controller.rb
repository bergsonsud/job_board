class CommentsController < ApplicationController
	
	# def new
 #    	@comment = Comment.new
 #  	end


	def create
	    @job = Job.find(params[:job_id])
	    @comment = @job.comments.build(comment_params)

	    if sucess = @comment.save
	    end

	    respond_to do |format|
	    	format.html do
		      if sucess
		        flash[:notice] = 'Job was successfully created.' 
		        
		      else
		        
		        flash[:alert] = "Por favor preencha todos os campos"
		        
		      end
	      	  redirect_to @job
	    	end
	    	format.js
	    end
  	end

  	def destroy  		
  		@comment = Comment.find(params[:id])
  		@comment.destroy
  		redirect_to @comment.job, notice: "Comentario excluido com sucesso!"  		
  	end
	
	private
	def comment_params
      params.require(:comment).permit(:name, :body)
    end

end	
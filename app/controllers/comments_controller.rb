class CommentsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		puts " adasdaf"
		params.permit(:article_id,:commenter, :body)
		commenter = params[:commenter]
		body = params[:body]
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(body: body, commenter: commenter)
		respond_to do |format|
			format.html { redirect_to article_path(@article) }
			format.js 
		end
		# unless @comment
		# 	flash[:danger] = "something wrong !"	
		# end
		
		
	end
	def destroy
	    @article = Article.find(params[:article_id])
	    @comment = @article.comments.find(params[:id])
	    @comment.destroy
		respond_to do |format|
			format.js {render :create}
		end
	end
	# private
    # def comment_params
    #   params.permit(:commenter, :body)
    # end
end

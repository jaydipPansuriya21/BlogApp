require 'export_blog'
class ArticlesController < ApplicationController
	def index
	    @articles = Article.all
	end

	def show
	  	@article = Article.find(params[:id])
	end

	def new
	    @article = Article.new
	end

	def create
	    @article = Article.new(article_params)
	    if @article.save
			flash[:info] = 'New Artical created successfully !'
	    	redirect_to root_path
	    else
	    	flash.now[:danger] = 'There is an error creating the article'
	      	render :new
	    end
	end

	def edit
    	@article = Article.find(params[:id])
  	end

  	def update
   		 @article = Article.find(params[:id])

    	if @article.update(article_params)
			flash[:info] = 'Artical Updated successfully !'
     		 redirect_to @article
    	else
			flash.now[:danger] = 'There is an error while updating  the article'
     		 render :edit
    	end
  	end
  	def destroy
    	@article = Article.find(params[:id])
   	 	@article.destroy
   	 	redirect_to root_path
 	end

	def test
		respond_to do |format|
			format.json {render :json => Article.all}
			format.xml {render :xml => Article.all}
		end
	end

	def export_blogs 
		export_blog = ExportBlog.new
		file_location = export_blog.export_blogs
		# in file_location path our excel file is ready, now we want to download it by using  
		# send_file method.
		send_file file_location,
				:disposition => 'attachment',
				:type => "application/csv",
				:x_sendfile => true
	end

	private
	    def article_params
	      params.require(:article).permit(:title, :body, :status)
	    end
end

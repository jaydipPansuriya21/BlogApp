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
	    	redirect_to @article
	    else
	    	flash.now[:notice] = 'There is an error creating the article'
	      	render :new
	    end
	end

	private
	    def article_params
	      params.require(:article).permit(:title, :body)
	    end
end

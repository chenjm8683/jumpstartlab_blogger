class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    
    def new
        @article = Article.new
    end
    
    def create
        #@article = Article.new(
        #    title = params[:article][:title]
        #    body = params[:article][:body])
        # @article = Article.new(ArticlesHelper.article_params)    #update to helpers won't reload
        @article = Article.new(params.require(:article).permit(:title, :body, :tag_list, :image))

        @article.save
        flash.notice = "Article '#{@article.title}' Created!"
        redirect_to article_path(@article)
    end
    
    def article_params
        params.require(:article).permit(:title, :body)
    end
    
    def destroy
        @article = Article.find(params[:id])
        title = @article.title
        @article.destroy
        flash.notice = "Article '#{title}' Deleted!"
        #redirect_to :action => :index
        redirect_to '/articles#index'
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        #@article.update(article_params)  #update to helpers cannot be reloaded
        @article.update(params.require(:article).permit(:title, :body, :tag_list, :image))
        flash.notice = "Article '#{@article.title}' Updated!"
        
        redirect_to article_path(@article)
    end
end

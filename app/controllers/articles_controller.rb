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
        #@article = Article.new(
        #    title = params[:article][:title]
        #    body = params[:article][:body])
        @article = Article.new(article_params) 
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
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' Updated!"
        
        redirect_to article_path(@article)
    end
end

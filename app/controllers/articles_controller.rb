class ArticlesController < ApplicationController

  before_action :setArticle, only: [:edit, :update, :show, :destroy]

  def index
    @all_articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was succesfully created!"
      redirect_to article_path(@article)
    else
      render :new
    end

  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was succesfully updated!"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:success] = "Article succesfully deleted!"
  end

  private

    def article_params
       params.require(:article).permit(:title, :description)
    end

    def setArticle
      @article = Article.find(params[:id])
    end

end
class ArticlesController < ApplicationController
  before_action :set_articles, only: %i[edit update destroy show]

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      redirect_to articles_path, notice: "#{@article.title} criado com sucesso!"
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit    
  end

  def show    
  end

  def update
    if @article.update(articles_params)
      redirect_to articles_path, notice: "#{@article.title} atualizado com sucesso!"
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path, notice: "#{@article.title} excluído com sucesso!"
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence
      render :index
    end
  end

  private
  
  def set_articles
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :body, :tag_id)
  end  
end

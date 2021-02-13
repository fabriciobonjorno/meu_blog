class ApplicationController < ActionController::Base
  before_action :set_articles

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      flash[:success] = 'Artigo adicionado com sucesso'
      redirect_to articles_path
    else
      flash[:error] = 'Erro ao adicionar artigo'
      render :new
    end
  end

  def edit    
  end

  def show    
  end
  

  def update
    if @article.update(articles_params)
      flash[:success] = 'Artigo alterado com sucesso'
      redirect_to articles_path
    else
      flash[:error] = 'Erro ao alterar artigo'
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = 'Artigo removido com sucesso'
      redirect_to articles_path
    else
      flash[:error] = 'Erro ao remover artigo'
      redirect_to articles_path
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

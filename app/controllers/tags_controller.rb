class TagsController < ApplicationController
  before_action :set_tags, only: %i[edit update destory]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)
    if @tag.save
      flash[:success] = 'Tag adicionada com sucesso'
      redirect_to articles_path
    else
      flash[:error] = 'Erro ao adicionar tag'
      render :new
    end
  end

  def edit
    
  end

  def update
    if @tag.update(tags_params)
      flash[:success] = 'Tag alterada com sucesso'
      redirect_to articles_path
    else
      flash[:error] = 'Erro ao alterar tag'
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = 'Tag removida com sucesso'
      redirect_to articles_path
    else
      flash[:error] = 'Erro ao remover tag'
      redirect_to articles_path
    end
  end
  

  private

  def set_tags
    @tag = Tag.find(params[:id])
  end

  def tags_params
    params.require(:tag).permit(:description)
  end  
end

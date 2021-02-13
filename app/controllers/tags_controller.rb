class TagsController < ApplicationController
  def index
  end

  private

  def set_tags
    @tag = Tag.find(params[:id])
  end

  def tags_params
    params.require(:tag).permit(:description)
  end
  
  
end

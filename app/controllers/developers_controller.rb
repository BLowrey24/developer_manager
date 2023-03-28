class DevelopersController < ApplicationController

  def index
    @developers = Developer.most_recent
  end

  def show
    @developer = Developer.find(params[:id])
    @game_count = @developer.game_count
  end
end
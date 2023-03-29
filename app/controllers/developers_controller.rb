class DevelopersController < ApplicationController

  def index
    @developers = Developer.most_recent
  end
  
  def show
    @developer = Developer.find(params[:id])
    @game_count = @developer.game_count
  end

  def new
  end

  def create
   developer = Developer.create(developer_params)
   redirect_to "/developers"
  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    developer = Developer.find(params[:id])
    @developer.update(developer_params)
    redirect_to "/developers/#{developer.id}"
  end

  def developer_params
    params.permit(:name, :location, :num_awards, :still_active)
  end

end
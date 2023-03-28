class DeveloperVideoGamesController < ApplicationController

  def index
    @developer = Developer.find(params[:id])
  end
end
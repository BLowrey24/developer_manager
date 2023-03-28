class DeveloperVideoGamesController < ApplicationController

  def index
    @developer = Developer.find(params[:developer_id])
  end
end
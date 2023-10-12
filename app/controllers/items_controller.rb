class ItemsController < ApplicationController
  def index
    @itams = Itame.all 
  end
end

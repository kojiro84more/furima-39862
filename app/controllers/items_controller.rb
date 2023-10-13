class ItemsController < ApplicationController
  def index
    @items = Iteme.all
  end
end

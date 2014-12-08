class StoresController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = Store.find(params[:id]).items
  end
end

class PagesController < ApplicationController

  def new
  end

  def create
    p "creating new page!"
    p params
  end
end

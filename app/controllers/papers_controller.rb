class PapersController < ApplicationController
  def index
    @papers = Paper.all
  end

  def show
    @paper = Paper.find(params[:slug])
  end
end

class PagesController < ApplicationController
  def home
    @posts = Post.all.first(5)
    @projects = Project.all.first(3)
  end

  def about
  end
end

class PagesController < ApplicationController
  def home
    @posts = Post.all.first(5)
    @projects = Project.all.first(3)
    @papers = Paper.all.first(3)
  end

  def about
    @page = Page.find("about")
  end

  def research
    @page = Page.find("research")
  end
end

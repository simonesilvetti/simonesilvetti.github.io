class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    raise MarkdownFile::NotFound, "no projects yet" if @projects.empty?
  end

  def show
    @project = Project.find(params[:slug])
  end
end

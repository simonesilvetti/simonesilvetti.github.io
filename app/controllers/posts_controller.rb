class PostsController < ApplicationController
  def index
    @posts = Post.all
    raise MarkdownFile::NotFound, "no posts yet" if @posts.empty?
  end

  def show
    @post = Post.find(params[:slug])
  end
end

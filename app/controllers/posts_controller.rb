class PostsController < ApplicationController
  def index
    @posts = Post.where(:member_email => session[:member_email])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if(member_signed_in?)
      @post.member_email = session[:member_email]
    end

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.member_email == session[:member_email]
      @post
    else
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.member_email == session[:member_email]
      @post
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end

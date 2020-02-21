class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts=Post.all
    end

    def show
    end

    def new
      @post=Post.new
    end

    def create
      @post= Post.new(post_params)
      redirect_to @post if @post.save
    end

    def edit
    end

    def update
      redirect_to @post if @post.save(post_params)
    end

    def destroy
      redirect_to :back if @post.destroy
    end

    private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

  
end

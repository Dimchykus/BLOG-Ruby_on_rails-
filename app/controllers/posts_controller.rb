
class PostsController < ApplicationController
    before_action :authenticate_user!, only: %i[new create edit update destroy]
    def index
        #@posts = Post.all
        @posts = Post.paginate(page: params[:page], per_page: 5).where(["title LIKE ?","%#{params[:search]}%"])
    end
    def show
        @post = Post.find(params[:id])
    end
    def new
        @post = Post.new
       
    end

    def create
        @post = Post.new(post_params.merge(user_id: current_user.id))
        # @post.author = current_user
        if @post.save
            redirect_to posts_path, :notice => "Post was created successfully"
        else
            render :new
        end 
    end
    def edit
        @post = Post.find(params[:id])
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path, :notice => "Post was deleted"
    end
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to posts_path, :notice => "Post was updated successfully"
        else
            render :edit
        end
    end
    private

    def post_params
      params.require(:post).permit(:title, :body, :likes, :image)
    end

end

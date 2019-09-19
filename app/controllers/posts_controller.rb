class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to current_user, flash: {success: "post created!"}
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private
  
    def posts_params
      params.require(:post).permit(:content, :picture)
    end

  # def microposts_current_user
  #   @micropost = current_user.microposts.find_by(id: params[:id])
  #   redirect_to root_url if @micropost.nil?
  # end
end

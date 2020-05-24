class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search]).order(publication_datetime: :desc).page params[:page]
  end

  def pending
    @posts = Post.pending.search(params[:search]).order(publication_datetime: :desc).page params[:page]
    render :index
  end

  def ready
    @posts = Post.ready.search(params[:search]).order(publication_datetime: :desc).page params[:page]
    render :index
  end

  def ready_for_twitter
    @posts = Post.ready_for_twitter.search(params[:search]).order(publication_datetime: :desc).page params[:page]
    render :index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    redirect_to action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:publication_datetime, :content)
    end
end

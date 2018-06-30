class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.daum_id = session[:current_cafe]
      if @post.save
        session.delete(:current_cafe)
        #flash[:notice] = 'Post was successfully created.' 
        redirect_to @post, flash: { success: 'Post was successfully created.' } # 어디로 가는지를 지정, flash의 키를 지정, 그리고 value = notice
      else
        p @post
        render :new 
      end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        redirect_to @post, flash: { success: 'Post was successfully updated.' }
      else
        render :edit 
      end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
      @post.destroy
      redirect_to posts_url, flash: { success: 'Post was successfully destroyed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :contents, :image_path, {avatars: []}) # 설정해 놓은 파라미터만 받을 수 있습니다. 
      #{title: params[:post][:title], contents: [:post][:title][:daum_id][:image_path]}
    end
end

class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new # フォーム用の空のインスタンスを生成する。
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "投稿を登録しました。"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params # ストロングパラメータを定義する
    params.require(:post).permit(:caption, :image)
  end


end

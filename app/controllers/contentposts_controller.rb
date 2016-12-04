class ContentpostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index]
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def new
    @contentpost = Contentpost.new
  end

  def index
    contentpost_master = Contentpost.where(user_id: current_user.id).order(created_at: :desc)
    @q = contentpost_master.search(params[:q])
    @contentposts = @q.result(distinct: true).page(params[:page])
  end

  def create
    @contentpost = current_user.contentposts.build(content_params)
    if @contentpost.save
      redirect_to @contentpost
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @contentpost.update(content_params)
      redirect_to @contentpost
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @contentpost.destroy
    redirect_to root_path
  end

  private
  def content_params
    params.require(:contentpost).permit(:content, :title)
  end

  def set_content
    @contentpost = Contentpost.find(params[:id])
  end

end

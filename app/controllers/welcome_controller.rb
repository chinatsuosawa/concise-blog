class WelcomeController < ApplicationController

  def index
    @contentpost = current_user.contentposts.build if user_signed_in?
    if user_signed_in?
      @contentposts = current_user.contentposts.order(created_at: :desc).page(params[:page])
    end
  end

end

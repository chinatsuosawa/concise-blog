class WelcomeController < ApplicationController

  def index
    @contentpost = current_user.contentposts.build if user_signed_in?
    if user_signed_in?
      @contentposts = current_user.contentposts.order(created_at: :desc)
    end
  end

  def show
    @contentposts = current_user.contentposts.order(created_at: :desc)
  end

end

class Contentpost < ActiveRecord::Base

  # それぞれの投稿は特定の1人のユーザーのものである
  belongs_to :user

  #titleが存在し、文字数は最大30
  validates :title, presence: true, length: { maximum: 30 }
  # contentが存在し、文字数は最大100000
  validates :content, presence: true, length: { maximum: 10000 }

end


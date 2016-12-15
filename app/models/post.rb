class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :comments, :as => :commentable
end

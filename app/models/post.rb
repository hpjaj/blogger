class Post < ActiveRecord::Base

  scope :most_recently_created, lambda { order("posts.created_at DESC")}
end

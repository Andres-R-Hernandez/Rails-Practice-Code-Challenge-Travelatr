class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent_posts
    self.posts.last(5).reverse
  end

  def featured_post
    self.posts.max_by{|post|post.likes}
  end

  def blogger_avg_age
    sum = self.bloggers.uniq.sum{|blogger|blogger.age}
    count = self.bloggers.uniq.count
    avg = sum / count
  end

end

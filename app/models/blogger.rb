class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true#, message: "Whoops, that name is already taken!"
  validates :age, numericality: { greater_than: 0 }#, message: "Whoops, you must be at least 1 yrs old!"
  validates :bio, length: {minimum: 30}#, message: "Whoops, your bio must be at least 30 characters long!"

  def total_likes
    self.posts.sum{|post|post.likes}
  end

  def featured_post
    self.posts.max_by{|post|post.likes}
  end

  def top_destinations
    unique_dest = self.destinations.uniq
    self.destinations.each
  end

end

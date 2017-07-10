class Review
  attr_accessor :customer, :restaurant, :content

  @@reviews = []

  def initialize(restaurant, content)
    @restaurant = restaurant
    @content = content
    @@reviews << self
  end

  def self.all
    @@reviews
  end

end

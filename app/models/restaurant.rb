class Restaurant
  attr_accessor :name

  @@restaurants = []

  def initialize(name)
    @name = name
    @restaurants << self
  end

  def self.all
    @@restaurants
  end

  def self.find_by_name(name)
    self.all.find { |restaurant| restaurant.name = name }
  end

  def reviews
    Review.self.all.select { |review| review.restaurant == self }
  end

  def customers
    Review.self.all.select do |review|
      review.restaurant == self
    end.map do |chosen_review|
      chosen_review.customer
    end.uniq
  end

end

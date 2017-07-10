# Please copy/paste all three classes into this file to submit your solution!

class Customer
  attr_accessor :first_name, :last_name, :customer, :reviews

  @@customers = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@customers << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    self.all.find { |customer| customer.full_name == name }
  end

  def self.find_all_by_first_name(name)
    self.all.select { |customer| customer.first_name == name }
  end

  def self.all_names
    self.all.map do |customer|
      customer.full_name
    end
  end

  def add_review(restaurant, content)
    new_review = Review.new(restaurant, content)
    new_review.customer = self
    new_review.restaurant = restaurant
  end
end

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

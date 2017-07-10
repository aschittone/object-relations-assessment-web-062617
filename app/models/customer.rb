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

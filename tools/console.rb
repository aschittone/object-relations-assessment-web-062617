require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

customer = Customer.new("andrew", "schittone")
review = customer.add_review("outback", "review")

Pry.start

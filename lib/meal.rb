class Meal
  require_relative './customer.rb'
  require_relative './waiter.rb'

  attr_accessor :all, :waiter, :customer, :total, :tip

  @@all = []

  def initialize(waiter, customer, total, tip)
    @waiter = waiter
    @customer = customer
    @total = total
    @tip = tip
    @@all << self
  end  # ends initialize method

  def self.all
    @@all
  end  # ends self.all method

  


end
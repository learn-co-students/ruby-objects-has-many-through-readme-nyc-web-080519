require 'pry'
class Customer

  attr_accessor :all

  @@all = [] 

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end  # ends initialize method
  
  def self.all
    @@all
  end  # ends self.all method

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end  # ends new_meal method

  def meals
    Meal.all.select { |meal| meal.customer == self }
  end  # ends meals method

  def waiters
    meals.collect { |meal| meal.waiter }  
  end  # ends waiters method



end
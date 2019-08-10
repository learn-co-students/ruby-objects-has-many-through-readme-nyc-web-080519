require 'pry'

class Waiter

  attr_accessor :all

  @@all = []

  def initialize(name, experience)
    @name = name
    @experience = experience
    @@all << self
  end  # ends initialize method

  def self.all
    @@all
  end  # ends self.all method

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end  # ends new_meal method

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end  # ends meals method

  def best_tipper
    meals.sort_by { |meal| meal.tip }.last.customer
  end  # ends best_tipper method
end
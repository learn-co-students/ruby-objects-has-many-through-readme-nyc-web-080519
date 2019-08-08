class Waiter

  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end 

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    biggest_tip = meals.first.tip
    biggest_tipper = meals.first.customer.name
    meals.each do |meal|
      if meal.tip > biggest_tip
        biggest_tip = meal.tip
        biggest_tipper = meal.customer
      end
    end
    return biggest_tipper
  end

end
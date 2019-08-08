class Waiter
    attr_accessor :name, :years_of_experience

    @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
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
    largest_tip = 0
    best_customer = ""
    self.meals.each do |meal|
        if meal.tip > largest_tip
            largest_tip = meal.tip
            best_customer = meal.customer
        end
    end
    return best_customer
  end  

  def self.all
    @@all
  end
end
class Waiter
    attr_reader :name, :exp_years

    @@all = []

    def initialize(name, exp_years)
        @name = name
        @exp_years = exp_years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        best_tip = meals.map { |meal| meal.tip }.max
        meals.each { |meal| return meal.customer if meal.tip == best_tip }
    end
end
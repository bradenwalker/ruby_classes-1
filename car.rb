class Car

  def initialize
    @distance = 0
    @fuel = 10
    puts "the initialize method is running automatically"
  end

  def get_info
    puts "I'm a car. I've driven #{@distance} miles and have #{@fuel} gallons of gas left."
  end

  def drive(miles)
    if miles < 200.0
	    if @fuel > 0.0
	      @distance += miles
	      @fuel -= miles / 20.0
	    else puts "This car is out of gas and needs to fuel up."
        end
    else puts "This car cannot travel that far."
    end
  end

  def fuel_up
    @fuel = 10.0
    price_per_gallon = 3.50
    fuel_total = price_per_gallon * @fuel
    puts "Your total: $#{fuel_total.to_i}"
  end

end
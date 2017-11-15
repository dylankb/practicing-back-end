module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Boat
  include Moveable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    self.propeller_count = propeller_count
    self.hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < Boat
  include Moveable

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # super(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers, num_hulls)
    super
  end
end

class Motorboat < Boat
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 2, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# My solution - Provided solution is more clear

# class Catamaran < Boat
#   include Moveable
#
#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#     self.propeller_count = num_propellers
#     self.hull_count = num_hulls
#   end
# end
#
# class Motorboat < Boat
#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     super(km_traveled_per_liter, liters_of_fuel_capacity)
#     self.hull_count = 2
#     self.propeller_count = 1
#   end
# end

auto = Auto.new
puts auto.range

cata = Catamaran.new(2,2,100,50)
puts cata.range

tug = Motorboat.new(100,50)
puts tug.range

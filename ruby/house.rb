class House
  attr_reader :name
  attr_accessor :cost
  attr_reader :size
  attr_reader :bedrooms
  attr_reader :bathrooms

  def initialize(name, size, bedrooms, bathrooms, cost = 0)
    @name = name
    @size = size
    @bedrooms = bedrooms
    @bathrooms = bathrooms
    @cost = cost
  end

  def mortgage(down_payment)
    
    temp_cost = @cost - down_payment
    if temp_cost < 0
      0
    else
      temp_cost / 180
    end
  end

  def to_s
    @name
  end
end

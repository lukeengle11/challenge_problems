class Person
  attr_reader :name
  attr_reader :ideal_house

  def initialize(name, salary, savings, ideal_house)
    @name = name
    @salary = salary
    @savings = savings
    @ideal_house = ideal_house
  end

  def afford?(house)
    mortgage_income >= house.mortgage(down_payment)
  end

  private

  def mortgage_income
    # Income deditated to a mortgage payment
    monthly_income * 0.4
  end

  def down_payment
    @savings * 0.9
  end

  def monthly_income
    # 0.36 for taxes.. Obviously this fluctuates based on pay
    @salary / 12 * 0.64
  end

end

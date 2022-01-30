#!/usr/bin/ruby -w

require_relative "house"
require "test/unit"

class TestHouse < Test::Unit::TestCase
  def test_mortgage_no_payment
    house = House.new("Test house", 2000, 3, 2, 500000)
    assert_equal(2777, house.mortgage(0))
  end

  def test_mortgage
    house = House.new("Test house", 2000, 3, 2, 500000)
    assert_equal(2222, house.mortgage(100000))
  end
end
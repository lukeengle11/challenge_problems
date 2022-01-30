#!/usr/bin/ruby
require "yaml"
require_relative "person"
require_relative "house"

people_data = YAML.load_file("people.yaml")
house_data = YAML.load_file("houses.yaml")

people = Array.new
houses = Array.new

people_data.each do |name, attributes|
  ideal_house = House.new("Ideal House",
                          attributes["house"]["size"],
                          attributes["house"]["bedrooms"],
                          attributes["house"]["bathrooms"])
  people.push(Person.new(name, attributes["salary"], attributes["savings"], ideal_house))
end

house_data.each do |model, attributes|
  houses.push(House.new(model,
                        attributes["size"],
                        attributes["bedrooms"],
                        attributes["bathrooms"],
                        attributes["price"]))
end

people.each do |person|
  affordable_houses = Array.new
  houses.each do |house|
    if person.afford?(house)
      affordable_houses.push(house)
    end
  end
  if !affordable_houses.empty?
    puts "#{person.name} can afford #{affordable_houses.join(", ")}"
  else
    puts "#{person.name} can't afford any houses :("
  end
end

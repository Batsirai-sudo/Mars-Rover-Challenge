# frozen_string_literal: true

# Class to set and get coordinates
class CoordinatesData
  attr_accessor :upper_plateau_coordinate, :position_compass_point, :x_coordinates, :y_coordinates, :instructions

  # class defined with getters and setter to get data and store it foor the
  # purpose of using it in different parts of the app
  def compass_point(data = nil)
    @position_compass_point = data
  end

  def cartisan_coordinates(data = nil)
    if !data.nil?
      @x_coordinates = data[0].to_i
      @y_coordinates = data[1].to_i
      @position_compass_point = data[2]
    else
      [@x_coordinates, @y_coordinates, @position_compass_point]
    end
  end

  def upper_plateau_coordinates(data = nil)
    if !data.nil?
      @upper_plateau_coordinate = data.map &:to_i
    else
      @upper_plateau_coordinate
    end
  end

  def instructions(data = nil)
    if !data.nil?
      @instructions = data
    else
      @instructions
    end
  end
end

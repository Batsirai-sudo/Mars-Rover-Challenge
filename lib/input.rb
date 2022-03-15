# frozen_string_literal: true
require_relative 'validation'

class Input < Validation

  # Prompt user to provide coordinates and instruction to drive the rover
  def roverInputs

    # Prompt user to enter Rovers Position
    puts 'Enter Rover position'
    position_coordinate = inputValidation 'position coordinates', gets.chomp.split('')

    puts 'Enter Rover instruction to explore plateau'
    instructions = inputValidation 'instructions', gets.chomp.split('')
    [position_coordinate, instructions]
  end

  # Prompt user to provide upper-right coordinates of the plateau
  def getPlateauCoordinates
    puts 'Enter plateau upper coordinates'
    upper_coordinate = gets.chomp.split('')
    inputValidation 'upper coordinates', upper_coordinate
  end

end

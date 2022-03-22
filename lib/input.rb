# frozen_string_literal: true
require_relative 'validation'

# Getting the inputs
class Input

  def initialize
    @validate = Validation.new
  end

  # Prompt user to provide coordinates and instruction to drive the rover
  def rover_position
    # Prompt user to enter Rovers Position
    puts 'Enter Rover position'
    position = gets.chomp.split('')
    @validate.input_validation('position coordinates', position)
  end

  def rover_instructions
    # Prompt user to enter Rovers Position
    puts 'Enter Rover instruction to explore plateau'
    instructions = gets.chomp.split('')
    @validate.input_validation('instructions', instructions)
  end

  def plateau_coordinates
    # Prompt user to provide upper-right coordinates of the plateau
    puts 'Enter plateau upper coordinates'
    upper_coordinate = gets.chomp.split('')
    @validate.input_validation('upper coordinates', upper_coordinate)
  end
end

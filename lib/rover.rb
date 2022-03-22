# frozen_string_literal: true

require_relative 'input'
require_relative 'data'
require_relative 'service'

# Rover class Object
class Rover
  attr_accessor :current_rover

  include Service

  def initialize
    super
    # instantiate the objects
    @coordinates_data = CoordinatesData.new
    @inputs = Input.new
    @current_rover = 1
    plateau_coordinates = @inputs.plateau_coordinates

  end

  def run
    # Get the inputs entered by user
    rover_position = @inputs.rover_position
    rover_instructions = @inputs.rover_instructions

    @coordinates_data.upper_plateau_coordinates(plateau_coordinates)
    @coordinates_data.cartisan_coordinates(rover_position)
    @coordinates_data.instructions(rover_instructions)
    process_instructions
  end

  # # running the loop for the instruction array to tell rover what to do
  def process_instructions
    catch :invalid_instruction do
      @coordinates_data.instructions.each do |instruction|
        throw :invalid_instruction unless execute_each_instructions(instruction.upcase)
      end
    end
    print_output
  end

  #
  # # method to execute individual instruction feed by the user in the terminal
  def execute_each_instructions(instruction)

    x, y, position_compass_point = @coordinates_data.cartisan_coordinates

    case instruction
    when 'L'
      @coordinates_data.compass_point(spin_left(position_compass_point))
    when 'R'
      @coordinates_data.compass_point(spin_right(position_compass_point))
    when 'M'
      x, y = move(x, y, position_compass_point)
      @coordinates_data.cartisan_coordinates([x, y, position_compass_point])
    else
      puts generate_error('instructions error', instruction)
      exit
    end
  end

  # displaying the expected output after the whole processes are done
  def print_output
    x, y, position_compass_point = @coordinates_data.cartisan_coordinates
    puts '-----------------------------------------------'
    puts "Expected Output:     #{x} #{y} #{position_compass_point}"
    puts '-----------------------------------------------'

    if @current_rover.even?
      puts 'Do you want to exit type YES or NO to continue?'
      exit if gets.upcase.include?('YES')
    end
    @current_rover += 1
    run
  end
end


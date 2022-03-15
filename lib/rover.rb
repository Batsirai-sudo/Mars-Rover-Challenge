# frozen_string_literal: true

require_relative 'input'
require_relative 'data'
require_relative 'service'

class Rover < Input
  attr_accessor :current_rover

  include Service

  def initialize
    super
    @current_rover = 1
    @data = Data.new
    @data.set_upper_plateau_coordinates getPlateauCoordinates
  end

  # method for driving the rover by getting all the necessary inputs
  def driveRover
    inputs = roverInputs
    @data.set_cartisan_coordinates inputs[0][0], inputs[0][1]
    @data.set_compass_point inputs[0][2]
    @data.set_instructions inputs[1]
    getInstructions
  end

  # running the loop for the instruction array to tell rover what to do
  def getInstructions

    catch :invalid_instruction do
      @data.getInstructions.each do |instruction|
        throw :invalid_instruction unless  executeRoverInstructions instruction.upcase
      end
    end
    displayOutput
  end
  
  # method to execute individual instruction feed by the user in the terminal
  def executeRoverInstructions instruction

    x, y, position_compass_point = @data.getCoordinates

    case instruction
    when 'L'
      @data.set_compass_point spin_left position_compass_point
    when 'R'
      @data.set_compass_point spin_right position_compass_point
    when 'M'
      x, y = move x, y, position_compass_point
      @data.set_cartisan_coordinates x, y 
    else
      puts generateError 'instructions', instruction
      exit
    end
  end

  # displaying the expected output after the whole processes are done
  def displayOutput
    x, y, position_compass_point = @data.getCoordinates
    puts '-----------------------------------------------'
    puts "Expected Output:     #{x} #{y} #{position_compass_point}"
    puts '-----------------------------------------------'

    if @current_rover.even?
      puts 'Do you want to exit type YES or NO to continue?'
      exit if gets.upcase.include?('YES')
    end
    @current_rover += 1
    driveRover
  end
end


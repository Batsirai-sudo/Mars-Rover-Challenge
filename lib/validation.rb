# frozen_string_literal: true
require_relative 'data'
require_relative 'service'

class Validation < Data
  attr_accessor :upper_coordinate, :position_coordinate

  # include Service module which contains some methods we want to
  # extend into validation class
  include Service

  # validation method for the input the user type in console
  def inputValidation validation_type, input

    case validation_type
    when 'upper coordinates'
      upper_coordinate = clearEmpty input

      upper_coordinate.find do |el|
        isValid = Integer el rescue false
        unless isValid
          puts generateError 'arguments'
          exit
        end
      end

      checkInputLength 2, upper_coordinate.length
      upper_coordinate
    when 'position coordinates'
      position_coordinate = clearEmpty input

      upper_coordinate = getUpperPlateauCoordinates
      checkInputLength 3, position_coordinate.length

      x_coordinate = position_coordinate[0].to_i.between? 0, upper_coordinate[0]  rescue false
      y_coordinate = position_coordinate[1].to_i.between? 0, upper_coordinate[1]  rescue false
      compass_point = 'N S E W'.include? position_coordinate[2].upcase  rescue false

      unless compass_point && x_coordinate && y_coordinate
        puts generateError 'arguments'
        exit
      end

      upperCase position_coordinate
    when 'instructions'
      upperCase clearEmpty input
    end
  end

  # checking the user input characters length if user supplied more
  # than or less than the required
  def checkInputLength requiredLength, inputLength

    if requiredLength > inputLength
      puts generateError 'few arguments',[requiredLength,inputLength]
      exit
    elsif requiredLength < inputLength
      puts generateError 'many arguments',[requiredLength,inputLength]
      exit
    end

  end

  # method for clearing spaces that the user entered in console
  def clearEmpty data
    return data.join(' ').split
  end

  #Transforming the user input to uppercase if the entered value was small letter
  def upperCase data
    data.map &:upcase
  end

end

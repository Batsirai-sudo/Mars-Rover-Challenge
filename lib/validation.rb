# frozen_string_literal: true
require_relative 'data'
require_relative 'service'

# input validation class
class Validation

  # include Service module which contains some methods we want to extend into validation class
  include Service

  def initialize
    @coordinates_data = CoordinatesData.new
  end
  # validation method for the input the user type in console

  def input_validation(validation_type, input)

    case validation_type
    when 'upper coordinates'

      upper_coordinate = clear_white_spaces(input)
      validate_upper_coordinates(upper_coordinate)

    when 'position coordinates'

      position_coordinates = clear_white_spaces(input)
      validate_position_coordinates(position_coordinates)

    when 'instructions'
      upper_case(clear_white_spaces(input))
    end
  end

  # checking the user input characters length if user supplied more than or less than the required

  def check_input_length(required_length, input_length)

    if required_length > input_length
      puts generate_error('few arguments', [required_length, input_length])
      exit
    elsif required_length < input_length
      puts generate_error('many arguments', [required_length, input_length])
      exit
    end

  end

  # # method for clearing spaces that the user entered in console
  def clear_white_spaces(data)
    data.join(' ').split
  end

  # # Transforming the user input to uppercase if the entered value was small letter
  def upper_case(data)
    data.map &:upcase
  end

  def match_regex(el)
    if el =~ /^([0-9])$/
      true
    else
      false
    end
  end

  def validate_upper_coordinates(data)
    data.find do |el|
      unless match_regex(el)
        puts generate_error('invalid arguments')
        exit
      end
    end
    check_input_length(2, data.length)
    return data
  end

  def validate_position_coordinates(data)
    upper_coordinate = @coordinates_data.upper_plateau_coordinates
    check_input_length(3, data.length)
    upper_case(data)
  end

end


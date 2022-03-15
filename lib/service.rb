module Service

  # method to turn rover to left according to the 'L' instruction
  def spin_left direction

    case direction
    when 'N'
      'W'
    when 'W'
      'S'
    when 'E'
      'N'
    when 'S'
      'E'
    else
      puts generateError 'instructions', direction
      exit
    end
  end

  # method to turn rover to right according to the 'R' instruction
  def spin_right direction

    case direction
    when 'N'
      'E'
    when 'W'
      'N'
    when 'E'
      'S'
    when 'S'
      'W'
    else
      puts generateError 'instructions', direction
      exit
    end
  end

  # method to move one grid forward in the direction of facing according to the 'M' instruction
  def move x,y,direction

    case direction
    when 'N'
      [x, y + 1]
    when 'W'
      [x - 1, y]
    when 'E'
      [x + 1, y]
    when 'S'
      [x, y - 1]
    else
      puts generateError 'instructions', direction
      exit
    end
  end

  # function which defines and generate errors for the whole application
  def generateError type,payload='Error occured'
    case type
    when 'instructions'
      "Allowed commands are: L, M, R but you entered invalid instruction #{payload}"
    when 'arguments'
      'Invalid Rover position coordinates'
    when 'few arguments'
      "Few arguments passed, expected  #{payload[0]} but found #{payload[1]}"
    when 'many arguments'
      "Many arguments passed, expected  #{payload[0]} but found #{payload[1]}"
    end
  end

end

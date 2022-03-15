
class Data

  # class defined with getters and setter to get data and store it foor the
  # purpose of using it in different parts of the app

  def set_compass_point data
    @@position_compass_point = data
  end

  def set_cartisan_coordinates x,y
    @@x_coordinates = x.to_i
    @@y_coordinates = y.to_i
  end

  def set_upper_plateau_coordinates data
    @@upper_plateau_coordinate = data.map &:to_i
  end

  def set_instructions data
    @@instructions = data
  end

  def getCoordinates
    [@@x_coordinates, @@y_coordinates, @@position_compass_point]
  end

  def getInstructions
    @@instructions
  end

  def getUpperPlateauCoordinates
    @@upper_plateau_coordinate
  end

end

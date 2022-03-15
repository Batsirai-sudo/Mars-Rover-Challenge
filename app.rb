#  frozen_string_literal: true

require_relative 'lib/input'
require_relative 'lib/rover'

class App < Rover

  # booting the application
  def startApplication
    driveRover
  end
end

App.new.startApplication


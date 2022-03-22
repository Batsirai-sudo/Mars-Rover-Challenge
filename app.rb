#  frozen_string_literal: true

require_relative 'lib/input'
require_relative 'lib/rover'

def main
  Rover.new.run
end

main
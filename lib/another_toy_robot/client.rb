require "another_toy_robot/arena"
require "another_toy_robot/robot"

class Client
  def initialize
    @table = Arena.new width: 5, height: 5
    @robot = Robot.new arena: @table
  end

  def command_for(input)
    input.new_command(@robot).execute
  end
end
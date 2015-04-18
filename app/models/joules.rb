class Joules
  attr_accessor :joules
  def initialize(watts, seconds)
    @joules = watts.to_i * seconds.to_i
  end
end
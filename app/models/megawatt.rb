class Megawatt
  attr_accessor :megawatts

  def initialize(megawatts)
    @megawatts = megawatts.to_i
  end

  def to_kw
    @megawatts * 1000.to_f
  end

  def to_w
    @megawatts * 1000000.to_f
  end

  def to_mw
    @megawatts
  end
end
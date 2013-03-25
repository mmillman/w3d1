class TowerOfHanoi
  attr_reader :rods
  def initialize(num_disks=3)
    @rods = Array.new(3) {Array.new}
    num_disks.downto(1).each { |disk| @rods[0] << disk }
  end

  def move_disk(from, to)
    if valid_move?(from, to)
      @rods[to] << @rods[from].pop
    end
  end

  def valid_move?(from, to)
    if @rods[from].empty?
      raise "InvalidMove"
    elsif @rods[to].empty?
      true
    else
      raise "InvalidMove" if @rods[to].last < @rods[from].last
      true
    end
  end
end
class TowerOfHanoi
  attr_reader :rods

  def self.new_game(num_disks=3)
    rods = Array.new(3) {Array.new}
    num_disks.downto(1).each { |disk| rods[0] << disk }

    TowerOfHanoi.new(rods)
  end

  def initialize(rods)
    @rods = rods
  end

  def move_disk(from, to)
    if valid_move?(from, to)
      @rods[to] << @rods[from].pop
    end
  end

  def valid_move?(from, to)
    raise "InvalidMove" unless [from, to].all? { |rod_num| rod_num.between?(0, 2) }
    if @rods[from].empty?
      raise "InvalidMove"
    elsif @rods[to].empty?
      true
    else
      raise "InvalidMove" if @rods[to].last < @rods[from].last
      true
    end
  end

  def num_disks
    @rods.flatten.count
  end

  def win?
    @rods[2].count == num_disks
  end
end
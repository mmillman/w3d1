class Array
  def my_uniq
    elements = {}
    self.each { |value| elements[value] = true }
    elements.keys
  end

  def two_sum
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        return true if self[i] + self[j] == 0
      end
    end

    false
  end

end
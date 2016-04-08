class String
  def numeric
    self.scan(/\d/).join("")
  end

  def alphanumeric
    self.gsub(/[^0-9a-z]/i, "")
  end

  def cap
    self.capitalize
  end

  def up
    self.upcase
  end

  def down
    self.downcase
  end
end
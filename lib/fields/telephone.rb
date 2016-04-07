class Telephone
  def initialize(telephone)
    @telephone = telephone.present? ? telephone.numeric : ""
  end

  def valid?
    [10, 11].include? @telephone.length
  end

  def masked
    if valid?
      return "(#{@telephone[0..1]}) #{@telephone[2..5]}-#{@telephone[6..9]}" if @telephone.length == 10
      return "(#{@telephone[0..1]}) #{@telephone[2..6]}-#{@telephone[7..10]}" if @telephone.length == 11
    else
      return @telephone
    end
  end

  def unmasked
    @telephone
  end
end
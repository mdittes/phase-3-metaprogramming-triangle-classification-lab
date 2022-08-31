class Triangle
  attr_reader :side1, :side2, :side3
  
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    confirm_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [side1, side2, side3].all?(&:positive?)
  end

  def triangle_inequality_authenticator?
    side1 + side2 > side 3 && side2 + side3 > side1 && side1 + side3 > side2
  end

  def confirm_triangle
    raise TriangleError unless sides_greater_than_zero? && triangle_inequality_authenticator?
  end

  class TriangleError < StandardError
  end

end

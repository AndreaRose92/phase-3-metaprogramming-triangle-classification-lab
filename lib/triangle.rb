class Triangle
  attr_reader :side1, :side2, :side3
  attr_writer :type

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
    if [side1, side2, side3].any? {|side| side <= 0}
      raise TriangleError
    end
    if side1 + side2 <= side3
      raise TriangleError
    end
    if side1 + side3 <= side2
      raise TriangleError
    end
    if side3 + side2 <= side1
      raise TriangleError
    end
  end

  def kind

    # if [side1, side2, side3].none? 0
      if side1 == side2 && side2 == side3
        self.type = :equilateral
      elsif side1 == side2 || side2 == side3 || side1 == side3
        self.type = :isosceles
      elsif side1 != side2 && side2 != side3 && side1 != side3
        self.type = :scalene
      end
    # else
    #   begin
    #     raise TriangleError
    #   rescue TriangleError => error
    #     puts error.message
    #   end
    # end
  end

  class TriangleError < StandardError
    def message
      "I'm afraid you can't do that, Star Fox"
    end
  end

end

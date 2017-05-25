class TriangleError < StandardError
 def message
   "Not a triangle!!!"
 end
end

class Triangle

  attr_reader :l1, :l2, :l3

  def initialize(l1, l2, l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
    @type = nil
  end

  def valid?
    (@l1 > 0 && @l2 > 0 && @l3 > 0) &&
    ((@l1 + @l2 > @l3) &&
    (@l1 + @l3 > @l2) &&
    (@l2 + @l3 > @l1))
  end

  def kind
    if !valid?
      raise TriangleError
    elsif valid?
      if @l1 == @l2 && @l2 == @l3
        @type = :equilateral
      elsif (@l1 == @l2) || (@l2 == @l3) || (@l1 == @l3)
        @type = :isosceles
      else
        @type = :scalene
      end
      @type
    end
  end

end


=begin
if !valid?
  begin
    raise TriangleError
  rescue TriangleError => error
    puts error.message
  end
=end

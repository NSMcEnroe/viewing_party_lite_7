class Cast
  attr_reader :cast
  def initialize(data)
    @cast = data[:cast]
  end
end
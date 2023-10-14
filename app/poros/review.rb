class Review
  attr_reader :total_reviews, :reviews
  def initialize(data)
    @total_reviews = data[:total_reviews]
    @reviews = data[:content]
  end
end
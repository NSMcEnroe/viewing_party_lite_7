class Review
  attr_reader :total_reviews, :author, :reviews, :rating 
  def initialize(data)
    @total_reviews = data[:total_results]
    @author = data[:author]
    @reviews = data[:content]
    @rating = data[:author_details][:rating]
  end
end
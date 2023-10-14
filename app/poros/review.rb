class Review
  attr_reader :total_reviews, :author, :review, :rating 
  def initialize(data, total_results)
    @total_reviews = total_results
    @author = data[:author]
    @review = data[:content]
    @rating = data[:author_details][:rating]
  end
end
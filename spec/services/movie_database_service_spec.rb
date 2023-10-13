require 'rails_helper'

describe MovieDatabaseService do
  context "class methods" do
    context "#top_rated_movies" do
      it "returns top movies", :vcr do
        search = MovieDatabaseService.new.top_rated_movies
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        movie_data = search[:results].first

        expect(movie_data).to have_key :original_title
        expect(movie_data[:original_title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end

    context "#search_movies" do
      it "returns movies based off of the keyword", :vcr do
        search = MovieDatabaseService.new.search_movies("blue")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        movie_data = search[:results].first

        expect(movie_data).to have_key :original_title
        expect(movie_data[:original_title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
  
  end
end

# require 'rails_helper'

# describe CongressService do
#   context "class methods" do
#     context "#members_by_state" do
#       it "returns member data" do
#         search = CongressService.new.members_by_state("CO")
#         expect(search).to be_a Hash
#         expect(search[:results]).to be_an Array
#         member_data = search[:results].first

#         expect(member_data).to have_key :name
#         expect(member_data[:name]).to be_a(String)

#         expect(member_data).to have_key :role
#         expect(member_data[:role]).to be_a(String)

#         expect(member_data).to have_key :district
#         expect(member_data[:district]).to be_a(String)

#         expect(member_data).to have_key :party
#         expect(member_data[:party]).to be_a(String)
#       end
#     end
#   end
# end
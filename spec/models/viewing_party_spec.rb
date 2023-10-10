RSpec.describe ViewingParty, type: :model do
  describe "relationships" do
    it { should have_many(:users).through(:user_viewing_parties) }
  end

  describe "validations" do
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
  end
end
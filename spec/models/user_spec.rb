require 'rails_helper'

RSpec.describe User, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:user)).to be_valid
	end

	it { should have_many(:interests) }
	it { should have_many(:books) }
	it { should have_many(:comments) }

  let(:user) { FactoryGirl.create(:user) }

  describe "interest associations" do

    let!(:older_interest) do
      FactoryGirl.create(:interest, user: user, created_at: 1.day.ago)
    end
    let!(:newer_interest) do
      FactoryGirl.create(:interest, user: user, created_at: 1.hour.ago)
    end

    it "should have the right interests in the right order" do
      expect(user.interests.to_a).to eq [newer_interest, older_interest]
    end

    it "should destroy associated interests" do
      interests = user.interests.to_a
      user.destroy
      expect(interests).not_to be_empty
      interests.each do |interest|
        expect(Interest.where(id: interest.id)).to be_empty
      end
    end
  end
end

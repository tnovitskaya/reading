require 'rails_helper'

RSpec.describe Interest, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:interest)).to be_valid
	end

	it { should belong_to(:user).class_name(User) }
	it { should belong_to(:book).class_name(Book) }
	it { should have_many(:comments) }

  
  let(:user) { FactoryGirl.create(:user) }
  let(:interest) { FactoryGirl.create(:interest) }

  describe "when user_id is not present" do
    before { interest.user_id = nil }
    it { should_not be_valid }
  end
end

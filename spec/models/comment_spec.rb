require 'rails_helper'

RSpec.describe Comment, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:comment)).to be_valid
	end

	it { should belong_to(:user).class_name(User) }
	it { should belong_to(:interest).class_name(Interest) }

  let(:user) { FactoryGirl.create(:user) }
  let(:interest) { FactoryGirl.create(:interest) }
  let(:comment) { FactoryGirl.create(:comment) }

  describe "when user_id is not present" do
    before { comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when interest_id is not present" do
    before { comment.interest_id = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { comment.content = nil }
    it { should_not be_valid }
  end

end

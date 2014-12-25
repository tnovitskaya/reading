require 'rails_helper'

RSpec.describe Comment, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:comment)).to be_valid
	end

	it { should belong_to(:user).class_name(User) }
	it { should belong_to(:interest).class_name(Interest) }
end

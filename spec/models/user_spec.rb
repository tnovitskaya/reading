require 'rails_helper'

RSpec.describe User, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:user)).to be_valid
	end

	it { should have_many(:interests) }
	it { should have_many(:books) }
	it { should have_many(:comments) }
end

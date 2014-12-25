require 'rails_helper'

RSpec.describe Publisher, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:publisher)).to be_valid
	end

	it { should have_many(:books) }
end

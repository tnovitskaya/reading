require 'rails_helper'

RSpec.describe Book, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:book)).to be_valid
	end

	it { should have_many(:book_and_author_links) }
	it { should have_many(:interests) }
	it { should have_many(:users) }
	it { should have_many(:authors) }
end

require 'rails_helper'

RSpec.describe Author, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:author)).to be_valid
	end

	it { should have_many(:book_and_author_links) }
	it { should have_many(:books) }
end

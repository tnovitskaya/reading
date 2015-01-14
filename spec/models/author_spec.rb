require 'rails_helper'

RSpec.describe Author, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:author)).to be_valid
	end

	it { should have_many(:book_and_author_links) }
	it { should have_many(:books) }

	let(:author) { FactoryGirl.create(:author) }

  describe "when first_name is not present" do
    before { author.first_name = nil }
    it { should_not be_valid }
  end

  describe "when last_name is not present" do
    before { author.last_name = nil }
    it { should_not be_valid }
  end

end

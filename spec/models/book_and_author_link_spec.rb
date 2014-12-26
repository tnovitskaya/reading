require 'rails_helper'

RSpec.describe BookAndAuthorLink, :type => :model do
	it "has a valid factory" do
		expect(FactoryGirl.build(:book_and_author_link)).to be_valid
	end

	it { should belong_to(:book).class_name(Book) }
	it { should belong_to(:author).class_name(Author) }
end

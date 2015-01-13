require 'rails_helper'

RSpec.describe Publisher, :type => :model do

  let(:publisher) { FactoryGirl.create(:publisher) }

  it { should have_many(:books) }

  it "has a valid factory" do
    expect(FactoryGirl.build(:publisher)).to be_valid
  end
  
  describe "when name is not present" do
    before { publisher.name = " " }
    it { should_not be_valid }
  end

end
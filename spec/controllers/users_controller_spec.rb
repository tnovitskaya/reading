require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  subject { FactoryGirl.create(:user) }

  describe "GET show" do
    it "returns http success" do
      get :show, id: subject
      expect(response).to have_http_status(:success)
    end
  end

end
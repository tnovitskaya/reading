require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    let(:interest) { FactoryGirl.create(:interest, user: user) }
    subject { FactoryGirl.create(:comment, user: user, interest: interest) }

    before do
      sign_in user
    end

    describe "GET #new" do
      it "assigns the requested comments to new comments" do
        get :new
        expect(assigns(:comment)).to be_new_record
      end

      it "renders the :new view" do
        get :new
        expect(response).to render_template "new"
      end
    end

    describe "GET #edit" do
      it "assigns the requested comment to subject" do
        get :edit, id: subject
        expect(assigns(:comment)).to eq(subject)
      end

      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "redirects to interest" do
          patch :update, id: subject, comment: { review: 'new_comment', :user => user, :interest => interest, :content => "test" }
          expect(response).to redirect_to(interest_path(interest))
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) { @comment = FactoryGirl.create(:comment, user: user, interest: interest) }

      it "deletes the comment" do
        expect {
          delete :destroy, id: @comment
        }.to change(Comment, :count).by(-1)
      end

      it "redirects to interest" do
        delete :destroy, id: @comment
        expect(response).to redirect_to(interest_path(interest))
      end
    end
  end


end

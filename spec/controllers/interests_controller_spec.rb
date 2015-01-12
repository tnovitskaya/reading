require 'rails_helper'

RSpec.describe InterestsController, :type => :controller do

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:interest, user: user) }

    before do
      sign_in user
    end

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested interest to subject" do
        get :index
        expect(assigns(:interests)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested interest to subject" do
        get :show, id: subject
        expect(assigns(:interest)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested interests to new interests" do
        get :new
        expect(assigns(:interest)).to be_new_record
      end

      it "renders the :new view" do
        get :new
        expect(response).to render_template "new"
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "creates new object" do
          expect{
            post :create, interest: FactoryGirl.attributes_for(:interest, :user_id => [user.id])
          }.to change(Interest, :count).by(1)
        end

        it "redirects to current user" do
          post :create, interest: FactoryGirl.attributes_for(:interest, :user_id => [user.id])
          expect(response).to redirect_to(user_path(user))
        end
      end
    end

    describe "GET #edit" do
      it "assigns the requested interest to subject" do
        get :edit, id: subject
        expect(assigns(:interest)).to eq(subject)
      end

      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "updates object" do
          expect{
            patch :update, id: subject, interest: { review: 'new_interest', :user_id => [user.id] }
          }.to change { subject.reload.review }.to('new_interest')
        end

        it "redirects to current user" do
          patch :update, id: subject, interest: { review: 'new_interest', :user_id => [user.id] }
          expect(response).to redirect_to(user_path(user))
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) { @interest = FactoryGirl.create(:interest, user: user) }
      
      it "deletes the interest" do
        expect {
          delete :destroy, id: @interest
        }.to change(Interest, :count).by(-1)
      end

      it "redirects to current user" do
        delete :destroy, id: @interest
        expect(response).to redirect_to(user_path(user))
      end
    end
  end

end

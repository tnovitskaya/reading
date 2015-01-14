require 'rails_helper'

RSpec.describe PublishersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    let(:author) { FactoryGirl.create(:author) }
    subject { FactoryGirl.create(:publisher) }

    before do
      sign_in user
    end

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested publisher to subject" do
        get :index
        expect(assigns(:publishers)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested publisher to subject" do
        get :show, id: subject
        expect(assigns(:publisher)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested publisher to new publisher" do
        get :new
        expect(assigns(:publisher)).to be_new_record
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
            post :create, publisher: FactoryGirl.attributes_for(:publisher)
          }.to change(Publisher, :count).by(1)
        end

        it "redirects to index path" do
          post :create, publisher: FactoryGirl.attributes_for(:publisher)
          expect(response).to redirect_to publishers_path
        end
      end
    end

    describe "GET #edit" do
      it "assigns the requested publisher to subject" do
        get :edit, id: subject
        expect(assigns(:publisher)).to eq(subject)
      end

      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template "edit"
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "updates object" do
          expect{
            patch :update, id: subject, publisher: { name: 'new_publisher' }
          }.to change { subject.reload.name }.to('new_publisher')
        end

        it "redirects to index path" do
          patch :update, id: subject, publisher: { name: 'new_publisher' }
          expect(response).to redirect_to publishers_path
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) { @publisher = FactoryGirl.create :publisher }
      
      it "deletes the publisher" do
        expect {
          delete :destroy, id: @publisher
        }.to change(Publisher, :count).by(-1)
      end

      it "redirects to publishers#index" do
        delete :destroy, id: @publisher
        expect(response).to redirect_to publishers_path
      end
    end
  end

end
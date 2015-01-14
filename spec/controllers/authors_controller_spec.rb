require 'rails_helper'

RSpec.describe AuthorsController, :type => :controller do

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:author) }

    before do
      sign_in user
    end

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested author to subject" do
        get :index
        expect(assigns(:authors)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested author to subject" do
        get :show, id: subject
        expect(assigns(:author)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested author to new author" do
        get :new
        expect(assigns(:author)).to be_new_record
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
            post :create, author: FactoryGirl.attributes_for(:author)
          }.to change(Author, :count).by(1)
        end

        it "redirects to index path" do
          post :create, author: FactoryGirl.attributes_for(:author)
          expect(response).to redirect_to authors_path
        end
      end
    end

    describe "GET #edit" do
      it "assigns the requested author to subject" do
        get :edit, id: subject
        expect(assigns(:author)).to eq(subject)
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
            patch :update, id: subject, author: { first_name: 'new', last_name: "author" }
          }.to change { subject.reload.first_name }.to('new')
        end

        it "redirects to index path" do
          patch :update, id: subject, author: { first_name: 'new', last_name: "author" }
          expect(response).to redirect_to authors_path
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) { @author = FactoryGirl.create :author }

      it "deletes the author" do
        expect {
          delete :destroy, id: @author
        }.to change(Author, :count).by(-1)
      end

      it "redirects to authors#index" do
        delete :destroy, id: @author
        expect(response).to redirect_to authors_path
      end
    end

  end
end

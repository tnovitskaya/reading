require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    let(:author) { FactoryGirl.create(:author) }
    subject { FactoryGirl.create(:book) }

    before do
      sign_in user
    end

    describe "GET #index" do
      it "render :index view" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested book to subject" do
        get :index
        expect(assigns(:books)).to eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested book to subject" do
        get :show, id: subject
        expect(assigns(:book)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested book to new book" do
        get :new
        expect(assigns(:book)).to be_new_record
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
            post :create, book: FactoryGirl.attributes_for(:book, :author_ids => [author.id])
          }.to change(Book, :count).by(1)
        end

        it "redirects to index path" do
          post :create, book: FactoryGirl.attributes_for(:book, :author_ids => [author.id])
          expect(response).to redirect_to books_path
        end
      end
    end

    describe "GET #edit" do
      it "assigns the requested book to subject" do
        get :edit, id: subject
        expect(assigns(:book)).to eq(subject)
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
            patch :update, id: subject, book: { name: 'new_book', author_ids: [author.id] }
          }.to change { subject.reload.name }.to('new_book')
        end

        it "redirects to index path" do
          patch :update, id: subject, book: { name: 'new_book', author_ids: [author.id] }
          expect(response).to redirect_to books_path
        end
      end
    end

    describe "DELETE #destroy" do
      before(:each) { @book = FactoryGirl.create :book }

      it "deletes the book" do
        expect {
          delete :destroy, id: @book
        }.to change(Book, :count).by(-1)
      end

      it "redirects to books#index" do
        delete :destroy, id: @book
        expect(response).to redirect_to books_path
      end
    end

  end
end

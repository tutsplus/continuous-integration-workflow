require 'rails_helper'

describe AuthorsController do
  let(:author) { FactoryGirl.create(:author) }

  describe 'GET #index' do
    before(:each) do
      get :index
    end

    it 'populates an array of authors' do
      expect(assigns(:authors).count).to eq(Author.count)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before(:each) do
      get :new
    end

    it 'sets an author variable' do
      expect(assigns(:author)).to be_a_new(Author)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:author_params) { { author: { first_name: 'Adam', last_name: 'Smith' } } }

    context 'with valid data' do
      it 'creates a new author' do
        expect {
          post :create, author_params
        }.to change(Author, :count).by(1)
      end

      it 'redirects to the authors page' do
        post :create, author_params
        expect(response).to redirect_to(authors_path)
      end
    end

    context 'with invalid data' do
      let(:author_params) { { author: { first_name: 'Adam', last_name: nil } } }

      it 'doesn\'t create a new author' do
        expect {
          post :create, author_params
        }.to_not change(Author, :count)
      end

      it 'should rerender the new template' do
        post :create, author_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    before(:each) do
      get :edit, id: author.id
    end

    it 'sets the author variable' do
      expect(assigns(:author)).to eq(author)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'with valid data' do
      it 'updates the author' do
        put :update, id: author.id, author: { first_name: 'Dan', last_name: 'Brown' }
        author.reload
        expect(author.first_name).to eq('Dan')
        expect(author.last_name).to eq('Brown')
      end

      it 'redirects to the authors page' do
        put :update, id: author.id, author: { first_name: 'Dan', last_name: 'Brown' }
        expect(response).to redirect_to(authors_path)
      end
    end

    context 'with invalid data' do
      it 'doesn\'t update the author' do
        put :update, id: author.id, author: { first_name: nil, last_name: 'Brown' }
        author.reload
        expect(author.first_name).to eq('Adam')
        expect(author.last_name).to eq('Smith')
      end

      it 'rerenders the edit page' do
        put :update, id: author.id, author: { first_name: nil, last_name: 'Brown' }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the author from the database' do
      author = FactoryGirl.create(:author)
      expect {
        delete :destroy, id: author.id
      }.to change(Author, :count).by(-1)
    end

    it 'redirects to the authors page' do
      delete :destroy, id: author.id
      expect(response).to redirect_to authors_path
    end
  end
end

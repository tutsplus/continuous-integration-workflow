require 'rails_helper'

RSpec.describe PublishersController, type: :controller do
  let(:publisher) { FactoryGirl.create(:publisher) }

  describe 'GET #index' do
    it 'assigns the publishers to an array' do
      FactoryGirl.create(:publisher)
      get :index
      expect(assigns(:publishers).count).to eq(Publisher.count)
      expect(assigns(:publishers).first).to be_a(Publisher)
    end

    it 'renders the index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before(:each) do
      get :new
    end

    it 'sets an publisher variable' do
      expect(assigns(:publisher)).to be_a_new(Publisher)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:publisher_params) { { publisher: { name: 'Ueberreuter' } } }

    context 'with valid data' do
      it 'creates a new publisher' do
        expect {
          post :create, publisher_params
        }.to change(Publisher, :count).by(1)
      end

      it 'redirects to the publishers page' do
        post :create, publisher_params
        expect(response).to redirect_to(publishers_path)
      end
    end

    context 'with invalid data' do
      let(:publisher_params) { { publisher: { name: nil } } }

      it 'doesn\'t create a new publisher' do
        expect {
          post :create, publisher_params
        }.to_not change(Publisher, :count)
      end

      it 'should rerender the new template' do
        post :create, publisher_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    before(:each) do
      get :edit, id: publisher.id
    end

    it 'sets the publisher variable' do
      expect(assigns(:publisher)).to eq(publisher)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'with valid data' do
      it 'updates the publisher' do
        put :update, id: publisher.id, publisher: { name: 'Ueberreuter' }
        publisher.reload
        expect(publisher.name).to eq('Ueberreuter')
      end

      it 'redirects to the publishers page' do
        put :update, id: publisher.id, publisher: { name: 'Ueberreuter' }
        expect(response).to redirect_to(publishers_path)
      end
    end

    context 'with invalid data' do
      it 'doesn\'t update the publisher' do
        put :update, id: publisher.id, publisher: { name: nil }
        publisher.reload
        expect(publisher.name).to eq('O\'Reilly Media')
      end

      it 'rerenders the edit page' do
        put :update, id: publisher.id, publisher: { name: nil }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the publisher from the database' do
      publisher = FactoryGirl.create(:publisher)
      expect {
        delete :destroy, id: publisher.id
      }.to change(Publisher, :count).by(-1)
    end

    it 'redirects to the publishers page' do
      delete :destroy, id: publisher.id
      expect(response).to redirect_to publishers_path
    end
  end
end

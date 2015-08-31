require 'rails_helper'

RSpec.describe BooksController do
  describe 'POST #create' do
    it 'saves the release date' do
      release_date = Date.today
      post :create, book: { isbn: '1234567890123', title: 'Some Book', release_date: release_date }
      expect(Book.find_by(isbn: '1234567890123').release_date).to eq(release_date)
    end
  end

  describe 'PUT #update' do
    it 'saves the release date' do
      book = FactoryGirl.create(:book)
      release_date = Date.today
      put :update, id: book.id, book: { release_date: release_date }
      book.reload
      expect(book.release_date).to eq(release_date)
    end
  end
end

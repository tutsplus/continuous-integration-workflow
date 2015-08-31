class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  belongs_to :publisher

  validates :isbn, uniqueness: true, format: { with: /\A\d+\Z/, message: 'must be digits only' }
  validates :title, presence: true

  before_validation :sanitize_isbn

  private

  def sanitize_isbn
    self.isbn = isbn.gsub(/-/, '')
  end
end

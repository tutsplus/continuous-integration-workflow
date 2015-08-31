require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'requires a first name' do
    author = FactoryGirl.build(:author, first_name: '')
    expect(author).to_not be_valid
  end

  it 'requires a last name' do
    author = FactoryGirl.build(:author, last_name: '')
    expect(author).to_not be_valid
  end
end

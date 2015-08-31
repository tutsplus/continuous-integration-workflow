require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'requires a name' do
    publisher = FactoryGirl.build(:publisher, name: '')
    expect(publisher).to_not be_valid
  end
end

FactoryGirl.define do
  factory :book do
    isbn "1234567890"
    title "Some Book Title"
    subtitle "Some Book Subtitle"
    release_date "2015-08-30"
    price 9.99
    edition 1
    pages 100
    abstract "Lorem Ipsum..."
  end

end

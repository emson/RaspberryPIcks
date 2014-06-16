
FactoryGirl.define do

  factory :user do
    username 'snoopy'
    sequence(:email) { |n| "test#{n}@test.com" }
    password 'password'
  end

  factory :post do
    sequence(:title) { |n| "My great creation #{n}" }
    sequence(:url) {   |n| "https://#{n}.greatcreation.com" }
    sequence(:text) {  |n| "All about my great creation #{n}." }
    points 1
    user_id 1
  end

end

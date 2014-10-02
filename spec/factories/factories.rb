
FactoryGirl.define do

  factory :user do
    sequence(:username) { |n| "snoopy#{n}" }
    sequence(:email)    { |n| "test#{n}@test.com" }
    password 'password'
  end

  factory :post do
    sequence(:title) { |n| "My great creation #{n}" }
    sequence(:url)   { |n| "https://www.greatcreation#{n}.com" }
    sequence(:text)  { |n| "All about my great creation #{n}." }
    points 1
    user_id 1
  end

  factory :vote do
    post_id 1
    user_id 1
  end

end

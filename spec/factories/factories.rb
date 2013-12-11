
FactoryGirl.define do

  factory :user do
    username 'snoopy'
    email 'test@test.com'
    password 'password'
  end

  factory :post do
    title 'some post title'
    url 'http://some.domain.com/my-post'
    user_id 1
  end
end

require 'spec_helper'

NUM_POSTS = 3

describe "posts/index" do
  before(:all) do
    FactoryGirl.create(:user)
    NUM_POSTS.times { FactoryGirl.create(:post) }
  end

  it "the homepage should display a list of posts" do
    visit '/'
    expect(page.all('main ul li').count == NUM_POSTS)
  end

end

# describe "the signin process", :type => :feature do

#   before :each do
#     User.make(:email => 'user@example.com', :password => 'caplin')
#   end

#   it "signs me in" do
#     visit '/sessions/new'
#     within("#session") do
#       fill_in 'Login', :with => 'user@example.com'
#       fill_in 'Password', :with => 'password'
#     end
#     click_link 'Sign in'
#     expect(page).to have_content 'Success'
#   end
# end

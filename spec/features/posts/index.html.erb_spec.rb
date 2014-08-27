require 'rails_helper'

describe "posts/index" do

  before(:each) do
    FactoryGirl.create(:user)
    NUM_POSTS.times { FactoryGirl.create(:post) }
    visit '/'
  end

  it "will display a list of all posts" do
    expect(Post.count).to eq(NUM_POSTS)
    expect(page.all('ul.posts > li').count).to eq(NUM_POSTS)
  end

  it "will link to the submit page" do
    click_link 'submit'
    expect(page).to have_css('#post_url')
  end


  it "will link to the new submissions page" do
    click_link 'new'
    expect(page).to have_content('Newest')
  end
  it "will link to the login page if not logged in" do
    click_link 'login'
    expect(page).to have_content('Sign in')
  end

  it "will link to the register page if not logged in" do
    click_link 'register'
    expect(page).to have_content('Sign up')
  end

  context 'Logged in User' do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user, :run_callbacks => false)
      visit '/'
    end

    after :all do
      logout(:user)
    end

    it "will link to the logout page if logged in" do
      expect(page.find_link("logout #{@user.username}").visible?)
    end

    it "will logout if logout link is clicked" do
      click_link("logout #{@user.username}")
      expect(page.find_link('login').visible?)
    end

  end

end


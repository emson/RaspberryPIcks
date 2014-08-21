require 'spec_helper'

describe "posts/index" do
  before(:all) do
    FactoryGirl.create(:user)
    NUM_POSTS.times { FactoryGirl.create(:post) }
  end

  it "will display a list of all posts" do
    visit '/'
    expect(page.all('main ul li').count == NUM_POSTS)
  end

  it "will link to the submit page" do
    visit '/'
    click_link 'submit'
    expect(page).to have_css('#post_url')
  end


  it "will link to the new submissions page" do
    visit '/'
    click_link 'new'
    expect(page).to have_content('Newest')
  end
  it "will link to the login page if not logged in" do
    visit '/'
    click_link 'login'
    expect(page).to have_content('Sign in')
  end

  it "will link to the register page if not logged in" do
    visit '/'
    click_link 'register'
    expect(page).to have_content('Sign up')
  end

  context 'Logged in User' do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user, :run_callbacks => false)
    end

    after :all do
      logout(:user)
    end

    it "will link to the logout page if logged in" do
      visit '/'
      expect(page.find_link("logout #{@user.username}").visible?)
    end

    it "will logout if logout link is clicked" do
      visit '/'
      click_link("logout #{@user.username}")
      expect(page.find_link('login').visible?)
    end

  end

end


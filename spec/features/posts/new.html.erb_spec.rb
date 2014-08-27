require 'rails_helper'

describe "posts/new" do

  before(:all) do
    FactoryGirl.create(:user)
    NUM_POSTS.times { FactoryGirl.create(:post) }
  end

  context 'Visitor not logged in' do

    before(:each) do
      visit '/posts/new'
    end

    it "will disable the post submit form fields" do
      expect(field_labeled('Url', disabled: true))
      expect(field_labeled('Title', disabled: true))
      expect(field_labeled('Text', disabled: true))
      expect(page).to_not have_css('input[type="submit"]')
    end

  end

  context 'Logged in User' do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user, :run_callbacks => false)
      visit '/posts/new'
    end

    after :all do
      logout(:user)
    end

    it "will enable the post submit fields" do
      expect(find_field('Url').visible?)
      expect(find_field('Title').visible?)
      expect(find_field('Text').visible?)
      expect(find_button('Create Post').visible?)
    end

  end

end


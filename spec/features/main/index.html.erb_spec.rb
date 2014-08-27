require 'rails_helper'

describe "main/index" do

  before(:each) do
    FactoryGirl.create(:user)
    NUM_POSTS.times { FactoryGirl.create(:post) }
    visit '/'
  end

  # Visitor is a user who hasn't logged in
  context 'Main Page: Not logged in visitor' do

    it "will display a list of all posts" do
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

    context 'visitor tries to vote' do

      it "will not increment a post vote" do
        within(:css, "ul.posts > li:first form:first") do
          hidden_post_id = first('#vote_post_id').value
          first_post     = Post.find(hidden_post_id)
          vote_count     = first_post.votes.count
          click_button('+')
          expect(first_post.votes.count).to eq(vote_count)
        end
      end
    end

  end


  context 'Main Page: Logged in User' do

    before :each do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user, :run_callbacks => false)
      # need to visit page in order for login to 'take'
      visit('/')
    end

    after :each do
      logout(:user)
    end

    it "will link to the logout page if logged in" do
      expect(page.find_link("logout #{@user.username}").visible?)
    end

    it "will logout if logout link is clicked" do
      click_link("logout #{@user.username}")
      expect(page.find_link('login').visible?)
    end

    it "will increment a post vote" do
      within(:css, "ul.posts > li:first form:first") do
        hidden_post_id = first('#vote_post_id').value
        first_post     = Post.find(hidden_post_id)
        vote_count     = first_post.votes.count
        click_button('+')
        expect(first_post.votes.count).to eq(vote_count + 1)
      end
    end

    it "will decrement a post vote" do
      within(:css, "ul.posts > li:first") do
        hidden_post_id = first('#vote_post_id').value
        first_post     = Post.find(hidden_post_id)
        vote_count     = first_post.votes.count
        click_button('+')
        expect(first_post.votes.count).to eq(vote_count + 1)
        click_button('-')
        expect(first_post.votes.count).to eq(vote_count)
      end
    end

  end


end


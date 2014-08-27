require 'spec_helper'

describe Vote do

  before :all do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    post_attrs = FactoryGirl.attributes_for(:post).merge(user_id: @user1.id)
    @post = Post.create(post_attrs)
    @vote1 = Vote.create(user_id: @user1.id, post_id: @post.id)
    @vote2 = Vote.create(user_id: @user2.id, post_id: @post.id)
  end

  context 'Vote#combined_params' do

    it "should create a combined_column" do
      vote = Vote.create!(user_id: 4, post_id: 2)
      expect(vote.combined_params eq(42))
    end

    it "should not validate if the combined_params are not unique" do
      Vote.create!(user_id: 99, post_id: 88)
      expect { Vote.create!(user_id: 99, post_id: 88) }.to raise_error("Validation failed: Combined params has already been taken")
    end

  end

  context 'Vote#user' do
    it "should belong to user" do
      expect(@vote1.user equ(@user1))
    end
  end

  context 'Vote#post' do
    it "should have a one post" do
      expect(@vote1.post equ(@post))
    end
  end

  context 'Post#votes' do
    it "should have many votes" do
      expect(@post.votes.count eq(2))
    end
  end

end

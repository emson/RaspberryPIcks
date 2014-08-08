require 'spec_helper'

describe Post do

  it "should be valid" do
    attrs = FactoryGirl.attributes_for(:post)
    Post.new(attrs).should be_valid
  end

  it "should validate on title" do
    attrs = FactoryGirl.attributes_for(:post)
    attrs.delete(:title)
    Post.new(attrs).should_not be_valid
  end

  it "should on creation also create a vote for that user" do
    user = FactoryGirl.create(:user)
    post_attrs = FactoryGirl.attributes_for(:post).merge(user_id: user.id)
    post = Post.create!(post_attrs)
    post.user.should == user
    post.votes.count.should == 1
  end

end

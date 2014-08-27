require 'rails_helper'

describe Post do

  it "should be valid" do
    attrs = FactoryGirl.attributes_for(:post)
    expect(Post.new(attrs)).to be_valid
  end

  it "should validate on title" do
    attrs = FactoryGirl.attributes_for(:post)
    attrs.delete(:title)
    expect(Post.new(attrs)).to_not be_valid
  end

  it "should on creation also create a vote for that user" do
    user = FactoryGirl.create(:user)
    post_attrs = FactoryGirl.attributes_for(:post).merge(user_id: user.id)
    post = Post.create!(post_attrs)
    expect(post.user).to eq(user)
    expect(post.votes.count).to eq(1)
  end

end

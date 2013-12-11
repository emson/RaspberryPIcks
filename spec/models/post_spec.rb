require 'spec_helper'

describe Post do
  it "should validate on title" do
    attrs = FactoryGirl.attributes_for(:post)
    attrs.delete(:title)
    Post.new(attrs).should_not be_valid
  end
end

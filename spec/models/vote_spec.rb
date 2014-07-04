require 'spec_helper'

describe Vote do

  subject { FactoryGirl.create(:vote) }

  it "should create a combined_column" do
    vote = Vote.create!(user_id: 4, post_id: 2)
    vote.combined_params.should == 42
  end

  it "should not validate if the combined_params are not unique" do
    subject # needed to already create a vote model
    expect { FactoryGirl.create(:vote) }.to raise_error("Validation failed: Combined params has already been taken")
  end

  it "should belong to user" do
    expect(subject.users).to have(nil)
  end

end

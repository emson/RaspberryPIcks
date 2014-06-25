require 'spec_helper'

describe Vote do
  subject { FactoryGirl.create(:vote) }

  it "should create a combined_column" do
    vote = FactoryGirl.create(user_id: 4, post_id: 2)
    vote.combined_params.should == 42
  end
end

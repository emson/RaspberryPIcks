require 'rails_helper'

describe User do

  it "should have many posts" do
    association = User.reflect_on_association(:posts)
    expect(association.macro).to eq(:has_many)
  end

  it "should have many votes" do
    association = User.reflect_on_association(:votes)
    expect(association.macro).to eq(:has_many)
  end

end

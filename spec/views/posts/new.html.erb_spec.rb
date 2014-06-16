require 'spec_helper'

describe "posts/new" do
  include Devise::TestHelpers

  before(:each) do
    assign(:post, stub_model(Post,
      :title => "MyString",
      :url => "MyString",
      :text => "MyText",
      :points => 1
    ).as_new_record)
  end

  it "renders new post form" do
    @user = FactoryGirl.create(:user)
    sign_in @user
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_url[name=?]", "post[url]"
      assert_select "textarea#post_text[name=?]", "post[text]"
    end
  end
end

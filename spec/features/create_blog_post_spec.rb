require 'rails_helper'

describe "A new blog post" do

  it "can be created and saved" do
    visit posts_path
    click_link "New Blog Post"
    expect( current_path ).to eq new_post_path 
    fill_in ':title', with: "First blog post"
  end

  it "has a body section" do
  end



end
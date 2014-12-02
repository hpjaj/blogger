require 'rails_helper'

describe "A new blog post" do

  it "can be created and saved" do
    visit posts_path
    click_link "New Blog Post"
    expect( current_path ).to eq new_post_path 
    fill_in 'Title', with: "First blog post"
    fill_in 'Body', with: "First body section"
    click_button "Create Blog Post"
    expect( current_path ).to eq posts_path
    expect( page ).to have_content("First blog post")
    expect( page ).to have_content("First body section")

  end

  it "has a body section" do
  end



end
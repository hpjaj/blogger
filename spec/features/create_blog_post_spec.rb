require 'rails_helper'

describe "A blog post" do

  it "can be created and saved by an admin" do
    visit posts_path
    click_link "New Blog Post"
    expect( current_path ).to eq new_post_path 
    fill_in 'Title', with: "First blog post"
    fill_in 'Body', with: "First body section"
    click_button "Save Blog Post"
    expect( current_path ).to eq posts_path
    expect( page ).to have_content("First blog post")
    expect( page ).to have_content("First body section")
  end

  context "once it has been created and saved" do

    before do
      @post = create(:post)
      visit posts_path
      click_link "My first blog post"
      expect( current_path ).to eq post_path(@post)
      expect( page ).to have_content("This is the body of the first blog post")
    end

    it "can be viewed in its entirety from its show page by any user type" do
      click_link "All Posts"
      expect( current_path ).to eq posts_path
    end

    it "can be edited and updated by an admin" do
      click_link "Edit Post"
      expect( page ).to have_content("This is the body of the first blog post")
      fill_in 'Body', with: "Blah blah tele-blah"
      click_button "Save Blog Post"
      expect( page ).to have_content("Blah blah tele-blah")
    end

    it "in the edit view, has a cancel button for admins, that brings you back to where you were last" do
      click_link "Edit Post"
      click_link "Cancel"
      expect( current_path ).to eq post_path(@post)
    end
  end

end
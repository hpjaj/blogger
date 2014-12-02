require 'rails_helper'

describe 'The sites layout links work i.e.' do

  before do
    @post_1 = create(:post, title: "First post", body: "This is the body section of the first note.")
    @post_2 = create(:post, title: "Second post")
    @post_3 = create(:post, title: "Third post")
    @post_4 = create(:post, title: "Fourth post")
    @post_5 = create(:post, title: "Fifth post")
    @post_6 = create(:post, title: "Sixth post")
  end

  it "the Blogger link redirects to the home page" do
    visit "/"
    within '.right-navigation' do
      click_link "First post"
    end
    expect( current_path ).to eq post_path(@post_1)
    click_link "Blogger"
    expect( current_path ).to eq root_path
  end

  it "the Archives link redirects to the archives page" do
    visit "/"
    click_link "Archives"
    expect( page ).to have_content("Blog Archive")
  end

  it "the pagination links move between index pages" do
    visit "/"
    expect( page ).to have_content("Previous")
    expect( page ).to have_content("Next")
    expect( page ).to_not have_content("This is the body section of the first note.")
    click_link "Next"
    expect( page ).to have_content("This is the body section of the first note.")
  end


end
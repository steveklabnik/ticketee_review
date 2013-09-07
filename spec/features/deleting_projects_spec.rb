require 'spec_helper'

feature "Deleting projects" do
  before do
    sign_in_as!(FactoryGirl.create(:admin_user))
  end

  scenario "Deleting a project" do
    FactoryGirl.create(:project, name: "TextMate 2")

    visit "/"
    click_link "TextMate 2"
    click_link "Delete Project"

    expect(page).to have_content("Project has been destroyed.")

    visit "/"

    expect(page).to have_no_content("TextMate 2")
  end
end

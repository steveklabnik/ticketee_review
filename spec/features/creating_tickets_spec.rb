require 'spec_helper'

feature "Creating Tickets" do
  before do
    project = FactoryGirl.create(:project)
    user = FactoryGirl.create(:user)
    define_permission!(user, "view", project)
    define_permission!(user, "create tickets", project)
    define_permission!(user, "tag", project)
    @email = user.email
    sign_in_as!(user)

    visit '/'
    click_link project.name
    click_link "New Ticket"
  end 

  scenario "Creating a ticket" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")

    within "#ticket #author" do
      expect(page).to have_content("Created by #@email")
    end
  end

  scenario "Creating a ticket without valid attributes fails" do
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Description must be longer than 10 characters" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "it sucks"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created.")
    expect(page).to have_content("Description is too short")
  end

  scenario "Creating a ticket with an attachment", js: true do
    fill_in "Title", with: "Add documentation for blink tag"
    fill_in "Description", with: "Blink tag's speed attribute"

    attach_file "File #1", Rails.root.join("spec/fixtures/speed.txt")

    click_link "Add another file"
    attach_file "File #2", Rails.root.join("spec/fixtures/spin.txt")

    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")
    
    within("#ticket .assets") do
      expect(page).to have_content("speed.txt")
      expect(page).to have_content("spin.txt")
    end
  end

  scenario "Creating a ticket with tags" do
    fill_in "Title", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    fill_in "Tags", with: "browser visual"
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has been created.")

    within("#ticket #tags") do
      expect(page).to have_content("browser")
      expect(page).to have_content("visual")
    end
  end
end

require 'spec_helper'

feature "Viewing tickets" do
  before do
    textmate_2 = FactoryGirl.create(:project,
                                    name: "TextMate 2")

    user = FactoryGirl.create(:user)
    define_permission!(user, "view", textmate_2)
    ticket = FactoryGirl.create(:ticket,
            project: textmate_2,
            title: "Make it shiny!",
            description: "Gradients! Starbursts! Oh my!")
    ticket.update(user: user)

    internet_explorer = FactoryGirl.create(:project,
                                           name: "Internet Explorer")
    define_permission!(user, "view", internet_explorer)

    FactoryGirl.create(:ticket,
            project: internet_explorer,
            title: "Standards compliance",
            description: "Isn't a joke.")

    sign_in_as!(user)
    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link "TextMate 2"

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do 1
      expect(page).to have_content("Make it shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end
end

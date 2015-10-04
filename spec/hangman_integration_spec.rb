require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("new game path") do
  it("can create new games", :type => :feature) do
    visit('/')
    fill_in('name', :with => "Ralph\'s Game")
    click_button("New Game")
    expect(page).to(have_content(
    "==================
     |               ||
                     ||
                     ||
                     ||
                     ||
                     ||
                     ||
                     ||
                     ||
     =================="))
  end
end
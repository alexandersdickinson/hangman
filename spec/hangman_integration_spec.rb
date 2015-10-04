require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("new game path") do
  before() do
    Hangman.delete()
  end
  
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
  
  it("displays the word representation below gallows", :type => :feature) do
    visit('/')
    fill_in('name', :with => "Ralph\'s Game")
    click_button("New Game")
    game = Hangman.all()[0]
    expect(page).to(have_content(game.word_representation().join('')))
  end
end
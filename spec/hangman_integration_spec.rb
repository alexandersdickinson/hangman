require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the new game path") do
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
    expect(page).to(have_content(game.word_representation().join(' ')))
  end
end

describe("the game completion path") do
  before() do
    Hangman.delete()
  end
  
  it("works correctly when the player enters the correct letter", :type => :feature) do
    visit('/')
    fill_in('name', :with => "Ralph\'s Game")
    click_button("New Game")
    test_game = Hangman.new("Test", Hangman.all()[0].word())
    letter = test_game.word()[0]
    test_game.match(letter)
    fill_in('letter', :with => letter)
    click_button("Enter")
    expect(page).to(have_content(test_game.word_representation().join(' ')))
  end
  
  it("draws a head when the player enters the incorrect letter", :type => :feature) do
    visit('/')
    click_button("New Game")
    fill_in('letter', :with => '7')
    click_button("Enter")
    expect(page).to(have_content(
    "==================
     |               ||
    ..               ||
  ( <  )             ||
    --               ||
                     ||
                     ||
                     ||
                     ||
                     ||
     =================="))
  end
  
  it("draws an entire body and ends the game when players have entered 5 incorrect letters", :type => :feature)
end
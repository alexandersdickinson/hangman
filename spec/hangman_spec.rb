require('rspec')
require('hangman')

describe(Hangman) do
  before() do
    Hangman.clear()
  end
  
  describe("#initialize") do
    it("randomly selects a word from a predetermined list of words") do
      words = %w(artichoke apple bolus donkey insomniac infarction domination dalliance traction terminus modus milieu illicit magazine catalogue chaos cavort carbuncle spelunker apiary mellifluous)
      test_hangman = Hangman.new()
      assigned = false
      words.each() do |word|
        if word == test_hangman.word()
          assigned = true
          break
        end
      end
      expect(assigned).to(eq(true))
    end
    
    it("creates an array with underscores representing each letter in the word") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word_array = []
      word.length().times do
        word_array.push('_')
      end
      expect(test_hangman.word_representation()).to(eq(word_array))
    end
  end
  
  describe("#match") do
    it("works with uppercase arguments") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      char = word[0].upcase()
      expect(test_hangman.match(char)).to(eq(true))
    end
    
    it("returns false when there is no match") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word = word.split('')
      false_letter = '7'
      expect(test_hangman.match(false_letter)).to(eq(false))
    end
    
    it("returns true when there is a match") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word = word.split('')
      letter = word[rand(word.length())]
      expect(test_hangman.match(letter)).to(eq(true))
    end
    
    it("fills in letters for the word's representation when there is a match") do
      test_hangman = Hangman.new()
      letter = test_hangman.word()[0]
      word = test_hangman.word()
      word = word.split('')
      test_representation = []
      word.length().times() {test_representation.push('_')}
      word.each_index do |i|
        test_representation[i] = letter if letter == word[i]
      end
      test_hangman.match(letter)
      expect(test_hangman.word_representation()).to(eq(test_representation))
    end
    
    it("increments a counter representing errors when there is no match") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word = word.split('')
      false_letter = '7'
      test_hangman.match(false_letter)
      expect(test_hangman.error_count()).to(eq(1))
    end
  end
  
  describe("#game_status") do
    it("returns 1 when the player wins") do
      test_hangman = Hangman.new()
      word = test_hangman.word().split('').uniq()
      word.each() do |char|
        test_hangman.match(char)
      end
      expect(test_hangman.game_status()).to(eq(1))
    end
    
    it("returns 0 when the game is still in progress") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      test_hangman.match(word[0])
      expect(test_hangman.game_status()).to(eq(0))
    end
    
    it("returns -1 when the players loses") do
      test_hangman = Hangman.new()
      false_letter = '7'
      6.times() {test_hangman.match(false_letter)}
      expect(test_hangman.game_status()).to(eq(-1))
    end
  end
  
  describe(".all") do
    it("starts as an empty array") do
      expect(Hangman.all()).to(eq([]))
    end
  end
  
  describe(".save") do
    it("adds a game to the list of games") do
      test_game = Hangman.new()
      Hangman.save(test_game)
      expect(Hangman.all()).to(eq([test_game]))
    end
  end
  
  describe(".find") do
    it("returns a game based on its id") do
      test_game = Hangman.new()
      Hangman.save(test_game)
      expect(Hangman.find(test_game.id())).to(eq(test_game))
    end
  end
end
require('rspec')
require('hangman')

describe(Hangman) do
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
    
    it("creates an array representing the word as it will appear to the player") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word_array = []
      word.length().times do
        word_array.push('_')
      end
      expect(test_hangman.word_representation()).to(eq(word_array))
    end
  end
  
  describe("#process") do
    it("returns false when there is no match") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word = word.split('')
      unique = false
      rand_letter = ''
      loop do
        rand_letter = (rand(26) + 97).chr()
        word.each() do |letter|
          unique = true if rand_letter != letter
        end
        break if unique
      end
      expect(test_hangman.process(rand_letter)).to(eq(false))
    end
    
    it("returns true when there is a match") do
      test_hangman = Hangman.new()
      word = test_hangman.word()
      word = word.split('')
      letter = word[rand(word.length() - 1)]
      expect(test_hangman.process(letter)).to(eq(true))
    end
  end
end
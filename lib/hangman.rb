class Hangman
  @@words = %w(artichoke apple bolus donkey insomniac infarction domination dalliance traction terminus modus milieu illicit magazine catalogue chaos cavort carbuncle spelunker apiary mellifluous)
  @@games = []
  
  def initialize(name = "Ralph", word = "rand")
    if word == "rand"
      @word = @@words[rand(@@words.length())]
    else
      @word = word
    end
    @word_representation = []
    @word.length().times() do
      @word_representation.push('_')
    end
    @error_count = 0
    @id = @@games.length() + 1
    @name = name
  end
  
  def name()
    @name
  end
  
  def id()
    @id
  end
  
  def word()
    @word
  end
  
  def error_count()
    @error_count
  end
  
  def word_representation()
    @word_representation
  end
  
  def self.all()
    @@games
  end
  
  def self.clear()
    @@games = []
  end
  
  def self.save(game)
    @@games.push(game)
  end
  
  def self.find(id)
    @@games.each() do |game|
      return game if game.id() == id
    end
  end
  
  def self.delete(game)
    @@games.delete(game)
  end
  
  def match(letter)
    letter.downcase!()
    match = false
    @word_representation.each_index() do |i|
      if @word[i] == letter
        @word_representation[i] = letter
        match = true
      end
    end
    if match
      true
    else
      @error_count = @error_count + 1
      false
    end
  end
  
  def game_status()
    if error_count > 5
      -1
    elsif !(@word_representation.include?('_'))
      1
    else
      0
    end
  end
end
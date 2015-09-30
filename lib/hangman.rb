class Hangman
  @@words = %w(artichoke apple bolus donkey insomniac infarction domination dalliance traction terminus modus milieu illicit magazine catalogue chaos cavort carbuncle spelunker apiary mellifluous)
  
  def initialize()
    @word = @@words[rand(@@words.length() - 1)]
    @word_representation = []
    @word.length().times() do
      @word_representation.push('_')
    end
  end
  
  def word()
    @word
  end
  
  def word_representation()
    @word_representation
  end
  
  def process(letter)
    match = false
    word.each_char do |char|
      match = true if char == letter
    end
    if match
      true
    else
      false
    end
  end
end
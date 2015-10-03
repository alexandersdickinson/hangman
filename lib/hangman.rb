class Hangman
  @@words = %w(artichoke apple bolus donkey insomniac infarction domination dalliance traction terminus modus milieu illicit magazine catalogue chaos cavort carbuncle spelunker apiary mellifluous)
  
  def initialize()
    @word = @@words[rand(@@words.length())]
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
      false
    end
  end
end
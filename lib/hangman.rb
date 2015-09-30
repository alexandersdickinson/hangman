class Hangman
  @@words = %w(artichoke apple bolus donkey insomniac infarction domination dalliance traction terminus modus milieu illicit magazine catalogue chaos cavort carbuncle spelunker apiary mellifluous)
  
  def initialize()
    @word = @@words[rand(@@words.length() - 1)]
  end
  
  def word()
    @word
  end
end
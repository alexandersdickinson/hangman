require('sinatra')
require('sinatra/reloader')
require('./lib/hangman')
also_reload('lib/**/*.rb')

get('/') do
  @games = Hangman.all()
  erb(:index)
end

post('/new') do
  name = params.fetch('name')
  @game = Hangman.new(name)
  Hangman.save(@game)
  @hung_man = 
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
=================="
  erb(:game)
end

post('/:id') do
  @game = Hangman.find(params.fetch('id').to_i())
  letter = params.fetch('letter')
  status = @game.match(letter) if letter != "continue"
  if @game.error_count == 0
    @hung_man =
"==================
 |              ||
                ||
                ||
                ||
                ||
                ||
                ||
                ||
                ||
=================="
    if @game.word_representation == @game.word().split('')
      @message = "You Win!"
      erb(:game_over)
    else
      erb(:game)
    end
  elsif @game.error_count == 1
     @hung_man =
"==================
 |              ||
  ..            ||
(  > )          ||
  --            ||
                ||
                ||
                ||
                ||
                ||
=================="
    if @game.word_representation == @game.word().split('')
      @message = "You Win!"
      erb(:game_over)
    else
      erb(:game)
    end
  elsif @game.error_count == 2
     @hung_man =
"==================
 |              ||
  ..            ||
(  > )          ||
  --            ||
--|--           ||
                ||
                ||
                ||
                ||
=================="
    if @game.word_representation == @game.word().split('')
      @message = "You Win!"
      erb(:game_over)
    else
      erb(:game)
    end
  elsif @game.error_count == 3
     @hung_man =
"==================
 |              ||
  ..            ||
(  > )          ||
  --            ||
--|--           ||
  |             ||
                ||
                ||
                ||
=================="
    if @game.word_representation == @game.word().split('')
      @message = "You Win!"
      erb(:game_over)
    else
      erb(:game)
    end
  elsif @game.error_count == 4
     @hung_man =
"==================
 |              ||
  ..            ||
(  > )          ||
  --            ||
--|--           ||
  |             ||
 ---            ||
                ||
                ||
=================="
    if @game.word_representation == @game.word().split('')
      @message = "You Win!"
      erb(:game_over)
    else
      erb(:game)
    end
  elsif @game.error_count == 5
     @message = "You Lose!"
     @hung_man =
"==================
 |              ||
  ..            ||
(  > )          ||
  --            ||
--|--           ||
  |             ||
|---|           ||
|   |           ||
                ||
=================="
    erb(:game_over)
  end  
end
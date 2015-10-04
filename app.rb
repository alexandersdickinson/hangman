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
  erb(:game)
end

post('/:id') do
  @game = Hangman.find(params.fetch('id').to_i())
  letter = params.fetch('letter')
  @game.match(letter)
  erb(:game)
end
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
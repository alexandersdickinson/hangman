require('sinatra')
require('sinatra/reloader')
require('./lib/hangman')
also_reload('lib/**/*.rb')
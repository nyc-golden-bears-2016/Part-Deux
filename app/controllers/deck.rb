# get '/' do
#   @deck = Deck.all #define instance variable for view
#   erb :'/index' #show all decks in homepage(index) view
# end

get '/deck/new' do
#  if logged_in?
  erb :'deck/new' #show new deck view
end

post '/deck' do
#  if logged_in?
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect '/deck/:deck_id/card/new'  #redirect to create cards for recently named deck
  else
    @errors = @deck.errors.full_messages
    erb :'deck/new'
  end
end

get '/deck/:id' do
  @deck = Deck.find(params[:id])
  erb :'deck/show'
end

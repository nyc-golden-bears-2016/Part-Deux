# get '/' do
#   @deck = Deck.all #define instance variable for view
#   erb :'/index' #show all decks in homepage(index) view
# end

get '/deck/new' do
  if logged_in?
  erb :'deck/new' #show new deck view
  else
  redirect '/login'
  end
end

post '/deck' do
 if logged_in?
  @deck = Deck.new(params[:deck].merge(user_id: current_user.id))
   if @deck.save
    redirect "/deck/#{@deck.id}"  #redirect to create cards for recently named deck
   else
    @errors = @deck.errors.full_messages
    erb :'deck/new'
   end
  end
end

get '/deck/:id' do
  @deck = Deck.find(params[:id])
  erb :'deck/show'
end

get '/deck/:id/edit' do
  @deck = Deck.find(params[:id]) #define intstance variable for view
  erb :'deck/edit' #show edit deck view
end

put '/deck/:id' do
  @deck = Deck.find(params[:id]) #define variable to edit
  @deck.assign_attributes(params[:deck]) #assign new attributes
  if @deck.save #saves new deck or returns false if unsuccessful
    redirect '/deck' #redirect back to deck index page
  else
    erb :'deck/edit'
  end
end

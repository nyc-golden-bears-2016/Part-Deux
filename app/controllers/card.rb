
get '/deck/:deck_id/card' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.card
  erb :'card/index'
end

get '/deck/:deck_id/card/new' do
  @deck = Deck.find(params[:deck_id])
  erb :'card/new'
end

post '/deck/:deck_id/card' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.new(params[:card])
  if @card.save
     # @success = "You have successfully added a card"
    erb :'card/new'
  else
    @errors
    erb :'card/new'
  end
end

get '/deck/:deck_id/card/:id' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
  erb :'card/show'
end

get '/deck/:deck_id/card/:id/edit' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
  erb :'card/edit'
end

put '/deck/:deck_id/card/:id' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
  if @card.update_attributes(params[:card])
    redirect "/deck/#{@deck.id}/card"
  else
    erb :'card/edit' #show edit card view again(potentially displaying errors)
  end
end

delete '/deck/:deck_id/card/:id' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.find(params[:id])
  @card.destroy
  redirect "/deck/#{@deck.id}"
end

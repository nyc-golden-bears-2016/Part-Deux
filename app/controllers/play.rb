get '/play/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  erb :'/play/deck'
end

get '/play/decks/:deck_id/cards/:card_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @card = Card.find_by(id: params[:card_id])
  erb :'/play/game'
end

post '/play/decks/:deck_id' do
  # binding.pry
  round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
  deck = Deck.find_by(id: params[:deck_id])
  card_ids = deck.cards.map do |card|
    card.id
  end
  session[:round_id] = round.id
  session[:card_order] = card_ids.shuffle
  redirect "/play/decks/#{deck.id}/cards/#{session[:card_order][0]}"
end

post '/play/game/check' do
  deck = Round.find_by(id: session[:round_id]).deck
  card = deck.cards.find_by(id: session[:card_order][0])
  guess = Guess.create(rounds_id: session[:round_id], users_id: session[:user_id], cards_id: card.id, content: params[:answer])
  if card.answer == params[:answer]
    guess.correct = true
    if session[:card_order].length == 1
      erb :'play/results'
    else
      session[:card_order] = session[:card_order][1..-1]
      @card = Card.find_by(id: session[:card_order][0])
      erb :'/play/game'
    end
  else
    "YOU ARE WRONG!!!"
  end
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user= User.new(params[:user])

  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

post '/login' do
  @username = params[:username]
  @password = params[:password]
  if User.find_by(username: params[:username]) && User.authenticate(@password)
    user_id = User.find_by(username: @username).id
    # @user = User.find_by(username: @username)
    session[:user_id] = user_id
    erb :'/'
  else
    @errors = ["Incorrect username or password"]
    erb :'/users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

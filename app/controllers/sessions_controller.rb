get '/sessions/new' do
	erb :'sessions/new'
end

post '/sessions' do
	@user = User.find_by(username: params[:username])

	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect '/'
	else
		@errors = ["Sorry, we did not find that username password combination in our system"]
		erb :'sessions/new'
	end
end

delete '/sessions' do
	session.clear
	redirect '/'
end
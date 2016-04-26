get '/users/new' do
	erb :'users/new'
end

get '/users/:id' do
	@user = User.find(params[:id])
	if correct_user?(@user)
		erb :'users/show'
	else
		redirect '/'
	end
end

post '/users' do
	@user = User.new(params[:user])

	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :'users/new'
	end
end

delete '/users/:id' do
	@user = User.find(params[:id])

	@user.posts.each do |post| 
		post.comments.each{|comment| comment.destroy}
		post.destroy
	end

	session.clear
	@user.destroy
	redirect '/'
end
get '/comments/:id/edit' do
	@comment = Comment.find(params[:id])
	erb :'comments/edit'
end

get '/posts/:id/comments/new' do
	@post = Post.find(params[:id])
	erb :'comments/new'
end

post '/posts/:id/comments' do
	@comment = Comment.new(params[:comment])
	@comment[:user_id] = current_user.id
	@comment[:post_id] = params[:id]

	if @comment.save
		redirect "/posts/#{@comment.post.id}"
	else
		@errors = @comment.errors.full_messages
		erb :'comments/new'
	end
end

put '/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.assign_attributes(params[:comment])
	if @comment.save
		redirect "/posts/#{@comment.post.id}"
	else
		@errors = @comment.errors.full_messages
		erb :'comments/edit'
	end
end

delete '/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect "/posts/#{@comment.post.id}"
end
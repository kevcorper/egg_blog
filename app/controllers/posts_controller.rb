get '/posts' do
	erb :'/posts/index'
end

get '/posts/new' do
  if logged_in?
  	erb :'/posts/new'
  else
  	redirect '/sessions/new'
  end
end

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	erb :'posts/edit'
end

get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'posts/show'	
end

put '/posts/:id' do
	@post = Post.find(params[:id])
	@post.assign_attributes(params[:post])
	if @post.save
		erb :"posts/show"
	else
		@errors = @post.errors.full_messages unless @post.save
		erb :'posts/edit'
	end
end

post '/posts' do
	@post = Post.new(params[:post])
	@post[:author_id] = current_user.id
	if @post.save
		if params[:tags]
			@tags = params[:tags].split(' ')
			@tags.each do |tag|
				found_tag = Tag.find_by(name: tag)
				found_tag ? @tag = found_tag : @tag = Tag.create(name: tag)
				PostTag.create(post_id: @post.id, tag_id: @tag.id)
			end
		end
		redirect '/'
	else
		@errors = @post.errors.full_messages
		erb :'/posts/new'
	end
end

delete '/posts/:id' do
	@post = Post.find(params[:id])
	@post.comments.each{|comment| comment.destroy}
	@post.destroy
	redirect '/'
end
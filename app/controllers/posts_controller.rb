get '/posts' do
	erb :'/posts/index'
end

get '/posts/new' do
  if logged_in? && request.xhr?
  	erb :'/posts/new', layout: false
  elsif logged_in?
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
		tags = params[:tags].split(' ')
		@post.tags = tags.map do |tag|
			Tag.first_or_create_by(name: tag)
		end
		# if params[:tags]
		# 	@tags = params[:tags].split(' ')
		# 	@tags.each do |tag|
		# 		found_tag = Tag.find_by(name: tag)
		# 		found_tag ? @tag = found_tag : @tag = Tag.create(name: tag)
		# 		PostTag.create(post_id: @post.id, tag_id: @tag.id)
		# 	end
		# end
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
		tags = params[:tags].split(' ')
		@post.tags = tags.map do |tag|
			Tag.find_or_create_by(name: tag)
		end
		# if params[:tags]
		# 	@tags = params[:tags].split(' ')
		# 	@tags.each do |tag|
		# 		found_tag = Tag.find_by(name: tag)
		# 		found_tag ? @tag = found_tag : @tag = Tag.create(name: tag)
		# 		PostTag.create(post_id: @post.id, tag_id: @tag.id)
		# 	end
		# end
		erb :"posts/show"
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
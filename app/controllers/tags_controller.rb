get '/tags' do
	erb :'tags/index'
end

get '/tags/:id' do
	@tag = Tag.find(params[:id])
	erb :'tags/show'
end

get '/tags/new' do
	erb :'tags/new'
end

post '/tags/posts/:id' do
	Tag.find_by(params[:tag][:name]) ? @tag = Tag.find_by(params[:tag][:name]) : @tag = Tag.create(params[:tag])
	PostTag.new(post_id: params[:id], tag_id: @tag.id)
end
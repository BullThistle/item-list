require ('sinatra')
require ('sinatra/reloader')
require ('./lib/item')

get'/' do
  @list = Item.all
  erb(:list)
end

post'/' do
  name = params["name"]
  rank = params["ranking"]
  item = Item.new(name, rank)
  item.save
  @list = Item.all
  erb(:list)
end

post '/runSort' do
    Item.sort_list
    @list = Item.all
    redirect '/'
    erb(:list)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end

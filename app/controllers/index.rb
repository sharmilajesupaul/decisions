####### Potential Partials #########
# _pro : renders pro with user id and timestamp on table
# _con : renders con with user id and timestamp on table
# _table_data : renders table name with user is and timestamp (for profile)
# _profile : renders a profile timeline with table_data, cons, and pros


get '/' do
  # displays the index with user login
  erb :index
end

get '/users/:id' do
  # profile page
  # CREATE profile.erb
  erb :profile
end

get '/users/:id/posts/new' do
  # create a new pros and cons table
  # CREATE post/new.erb
  erb :'post/new'
end

get '/redirect_auth_url' do
  # client_id
  # redirect to api url
end

get '/logged_in' do
  # page rendered when user is logged in
  # CREATE logged_in.erb
  erb :logged_in
end




####### Potential Partials #########
# _pro : renders pro with user id and timestamp on table
# _con : renders con with user id and timestamp on table
# _table_data : renders table name with user is and timestamp (for profile)
# _profile : renders a profile timeline with table_data, cons, and pros


get '/' do
  # displays the index with user login
  if session['user_id'] != nil
    user_id = session['user_id']
    p user_id
    redirect "/users/#{user_id}"
  else
    # p sessions
    erb :index
  end
end

get '/users/:id' do
  @all_the_things = []
  user_id = params[:id]
  @user = User.find(user_id)
  @users = User.all
  @posts = Post.all
  @weights = Weight.all

  @all_the_things << @posts.flatten
  @all_the_things << @weights.flatten
  @timeline_objs = @all_the_things.flatten.sort_by{|thing| thing.created_at}.reverse
  # p @timeline_objss
  erb :profile
end

get '/posts/new' do

  erb :_table_form, layout: false
end

post '/posts/new' do
  @user = User.find(session['user_id'])
  # puts params[:post]
  new_post = Post.create(params[:post])
  @user.posts << new_post


  content_type :json
  # p params[:title]
  # p params[:content]
  # p new_post
  @user.posts.find(new_post.id).to_json
  # redirect "/users/#{@user.id}"
  # erb :_table_info, layout: false, locals { post: new_post }
end

# get '/weights/new' do

#   erb :_pro_form, layout: false
# end


# post '/weights/new' do
#   @user = User.find(session['user_id'])
#   # puts params[:post]
#   new_weight = Weight.create(params[:weight])
#   @user.weights << new_weight


#   content_type :json
#   # p params[:title]
#   # p params[:content]
#   # p new_post
#   @user.weights.find(new_weight.id).to_json
#   # redirect "/users/#{@user.id}"
#   # erb :_table_info, layout: false, locals { post: new_post }
# end





get '/users/:id/posts/:post_id' do
  @user = User.find(params[:id])
  @post = Post.find(params[:post_id])
  @weights = @post.weights
  @pros = []
  @cons = []
  @weights.each do |weight|
    if weight.pro == true
      @pros << weight
    else
      @cons << weight
    end
  end

  erb :table
end
########### LOGIN ################


get '/users/:id/posts/new' do
  # create a new pros and cons table
  # CREATE post/new.erb
  erb :'post/new'
end

post '/sessions' do
  # @error = false
  p params[:username]
  p params[:password]
  @user = User.find_by(username: params[:username])
  p @user
  p @user.authenticate(params[:password])
  if @user
    if @user.authenticate(params[:password])
      session['user_id'] = @user.id

      redirect "/users/#{@user.id}"
    end
  else
    @error = true
    redirect "/"
  end
end

delete '/sessions/:id' do
  session['user_id'] = nil

  redirect '/'
end


 ############### Google Login #######

 get '/redirect_auth_url' do
  client_id = ENV["CLIENT_ID"]
  scope_url = "https://www.googleapis.com/auth/plus.login&state=12345&approval_prompt=force"
  redirect_uri = "http://localhost:9393/logged_in"
  # redirect to api url
  redirect "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=#{client_id}&redirect_uri=#{redirect_uri}&scope=#{scope_url}"
end

get '/logged_in' do

  # p params # these are your string query parameters (your authorization code will be in here!)

  token_response = HTTParty.post("https://accounts.google.com/o/oauth2/token",
    body: {
      code: params[:code],
      client_id: ENV["CLIENT_ID"],
      client_secret: ENV["SECRET_KEY"],
                                      redirect_uri: "http://localhost:9393/logged_in", # what you specify in your developer console (this matches the route we are currently in)
                                      grant_type: "authorization_code"
                                      })

  # p token_response # returns an access_token, expires_in, refresh_token (optionally)
  # in order to make a request to the Google + API, we need to enable it in our Google Developer Console
  @google_plus_response = HTTParty.get("https://www.googleapis.com/plus/v1/people/me?access_token=#{token_response["access_token"]}")

  @session_user = User.find_or_create_by(display_name: @google_plus_response["displayName"])
  session['user_id'] = @session_user.id
  p session
  # erb :logged_in
  redirect "/users/#{@session_user.id}"
end
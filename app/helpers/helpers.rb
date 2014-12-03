helpers do

  def current_user
    return false if session['user_id'].nil?
    user = User.find(session["user_id"])
    return user
  end

end
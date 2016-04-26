module Sessions
	def logged_in?
		session[:user_id]
	end

	def current_user
		User.find(session[:user_id])
	end

	def correct_user?(user)
		session[:user_id] == user.id
	end
end

helpers Sessions
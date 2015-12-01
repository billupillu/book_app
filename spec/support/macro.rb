def set_current_user(user=nil)
	session[:user_id] = (user || Fabricate(:user)).id
end

def set_current_admin(admin=nil)
	session[:user_id] = (admin || Fabricate(:admin)).id
end

def clear_current_user
	session[:user_id] = nil
end

def current_user
	User.find(session[:user_id])
end

def sign_in_as(admin)
	visit root_path
	click_link "Sign In"
	fill_in "sessionEmail",with: admin.email
	fill_in "sessionPassword",with: admin.password
	click_button "Sign In"
	expect(page).to have_content("Successfuly Signed in")
end
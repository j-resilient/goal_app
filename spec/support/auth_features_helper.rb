module AuthFeaturesHelper
    def sign_up
        visit new_user_url
        fill_in "Username", with: "username"
        fill_in "Password", with: "password"
        click_button "Sign Up"
    end

    def login
        visit new_session_url
        fill_in "Username", with: "username"
        fill_in "Password", with: "password"
        click_button "Log In"
    end
end
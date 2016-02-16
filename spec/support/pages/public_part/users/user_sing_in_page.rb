class UserSingInPage < SitePrism::Page
  set_url '/users/sign_in'

  element :email, "input[name='user[email]']"
  element :password, "input[name='user[password]']"
  element :sing_in, "input[type='submit']"
end

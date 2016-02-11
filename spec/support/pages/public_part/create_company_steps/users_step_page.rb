require_relative 'steps_menu_section'

class UsersStepPage < SitePrism::Page
  set_url '/create_company_steps/users/new'

  element :email, "input[name='user[email]']"
  element :password, "input[name='user[password]']"
  element :password_confirmation, "input[name='user[password_confirmation]']"
  element :next_button, "input[type='submit']"
  section :steps_menu, StepsMenuSection, '.nav.nav-pills'

  def submit_form(data)
    email.set data[:email]
    password.set data[:password]
    password_confirmation.set data[:password_confirmation]
    next_button.click
  end
end

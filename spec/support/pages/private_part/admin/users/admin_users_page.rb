require_relative 'users_section'
class AdminUsersPage < SitePrism::Page
  set_url '/manage/admin/users'

  sections :users, UsersSection, 'table tbody tr'

  def click_block_user(email_user)
    user_by(email_user).block_button.click
  end

  def click_unblock_user(email_user)
    user_by(email_user).unblock_button.click
  end

  def user_by(email_user)
    users.find { |u| u.name.text == email_user }
  end

  def users_email
    users.map { |user| user.name.text }
  end
end

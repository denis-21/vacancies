class AdminUsersPage < SitePrism::Page
  set_url '/admin/users'

  elements :users_email, 'table tbody tr td:first'
  elements :block_buttons, '.btn_block'
  elements :unblock_buttons, '.btn_unblock'
  def click_block_user
    block_buttons.first.click
  end

  def click_unblock_user
    unblock_buttons.first.click
  end
end

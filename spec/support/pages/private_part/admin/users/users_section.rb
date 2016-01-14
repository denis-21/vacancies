class UsersSection < SitePrism::Section
  element :name, 'td:first-child'
  element :block_button, 'td:last-child a.btn_block'
  element :unblock_button, 'td:last-child a.btn_unblock'
end

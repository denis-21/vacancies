class AllExternalClients < SitePrism::Page
  set_url '/manage/admin/external_clients'

  element :button_new, '.new_ext_client'
  elements :client_links, 'table tbody tr td:first a'
  elements :delete_buttons, 'table tbody tr td:last a'

  def click_client(name_client)
    link = client_links.find { |name| name.text == name_client }
    link.click
  end

  def name_clients
    client_links.map(&:text)
  end
end

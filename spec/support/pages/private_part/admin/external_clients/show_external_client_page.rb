class ShowExternalClient < SitePrism::Page
  set_url '/admin/external_clients/{id}'

  element :delete_button, '.btn-danger'
end

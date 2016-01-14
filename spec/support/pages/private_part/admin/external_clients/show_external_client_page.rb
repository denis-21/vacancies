class ShowExternalClient < SitePrism::Page
  set_url '/manage/admin/external_clients/{id}'

  element :delete_button, '.btn-danger'
end

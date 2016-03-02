class ManageCompanyPage < SitePrism::Page
  set_url '/admin/companies/{id}'

  element :edit_button, '.btn-warning'
  element :delete_button, '.btn-danger'
end

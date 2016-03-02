class NewExternalClient < SitePrism::Page
  set_url '/admin/external_clients/new'

  element :name, "input[name='external_client[name]']"
  element :description, "input[name='external_client[description]']"
  element :secret_key, "input[name='external_client[secret_key]']"
  element :button_add, "input[type='submit']"
end

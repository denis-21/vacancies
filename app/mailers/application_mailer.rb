class ApplicationMailer < ActionMailer::Base
  default from: 'vacancy_test_site@example.com'
  layout 'mailer'

  def self.inherited(subclass)
    subclass.default template_path: "mailers/#{subclass.name.to_s.underscore}"
  end
end

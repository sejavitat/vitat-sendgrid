Vitat::Sendgrid.configure do |config|
  config.api_key = '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'
  config.from_mail = 'nao-responda@vitat.com.br'
  config.from_name = 'Vitat'
end


sendgrid_client = Vitat::Sendgrid::Client.new

sendgrid_client.send_template_email(
  'julia.frederico@vitat.com.br',
  'd-223ce8c0589e44aa9cb01b680c581f3a',
  {
    data: {
      urlNewPassword: 'www.vitat.com.br',
    },
    categories: ['DEV']
  }
)
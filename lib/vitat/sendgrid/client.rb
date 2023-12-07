require 'sendgrid-ruby'
require_relative "configuration"

module Vitat
  module Sendgrid
    class Client
      attr_reader :status_code

      def initialize
        if Vitat::Sendgrid.configuration.invalid?
          raise "Missing {api_key, from_mail, from_name} configuration"
        end

        @from_mail = Vitat::Sendgrid.configuration.from_mail
        @from_name = Vitat::Sendgrid.configuration.from_name
        @sendgrid_client = SendGrid::API.new(api_key: Vitat::Sendgrid.configuration.api_key).client
      end

      def send_template_email(to, template_id, params = {})
        personalizations = params[:data] || {}
        categories = params[:categories] || []
        send_email(template_request_body(to, template_id, personalizations, categories))
        status_code <= 202
      end

      private

      def template_request_body(to, template_id, personalizations, categories)
        {
          personalizations: [
            {
              to: [{ email: to }],
              dynamic_template_data: personalizations
            }
          ],
          from: {
            email: @from_mail,
            name: @from_name
          },
          template_id: template_id,
          categories: categories
        }
      end
  
      def send_email(request_body)
        response = @sendgrid_client.mail._('send').post(request_body: request_body)
        @status_code = response.status_code&.to_i
      end
    end
  end
end

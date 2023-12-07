module Vitat
  module Sendgrid
    class Configuration
      attr_accessor :api_key, :from_mail, :from_name

      def initialize
        @api_key = nil
        @from_mail = nil
        @from_name = nil
      end

      def valid?
        !invalid?
      end

      def invalid?
        api_key&.empty? || from_mail&.empty? || from_name&.empty?
      end
    end
  end
end

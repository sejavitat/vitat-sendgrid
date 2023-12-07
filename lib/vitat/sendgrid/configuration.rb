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
        api_key.present? && from_mail.present? && from_name.present?
      end

      def invalid?
        !valid?
      end
    end

    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end

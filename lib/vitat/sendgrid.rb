# frozen_string_literal: true

require_relative "sendgrid/version"
require_relative "sendgrid/configuration"
require_relative "sendgrid/client"

module Vitat
  module Sendgrid
    class Error < StandardError; end

    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= Configuration.new
        yield(configuration)
      end
    end
  end
end

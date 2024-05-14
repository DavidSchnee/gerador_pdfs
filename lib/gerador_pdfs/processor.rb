# frozen_string_literal: true

module GeradorPdfs
  class Processor
    attr_reader :payload

    def self.call(payload)
      new(payload).call
    end

    def initialize(payload)
      @payload = payload.deep_symbolize_keys
    end

    def call
      resource_class.send(:call, @event[:params])
    end

    private

    def resource_request_class
      @event[:resource]
    end

    def resource_class
      "#{resource_request_class}".constantize
    end
  end
end

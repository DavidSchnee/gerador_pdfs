# frozen_string_literal: true

module GeradorPdfs
  class Processor
    attr_reader :event

    def self.call(event)
      new(event).call
    end

    def initialize(event)
      @event = event
    end

    def call
      resource_class.send(:call, @event["params"])
    end

    private

    def resource_request_class
      @event["resource"]
    end

    def resource_class
      constantize(resource_request_class)
    end

    def constantize(class_name)
      Object.const_get(class_name)
    end
  end
end

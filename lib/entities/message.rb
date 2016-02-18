require "active_model"

module Entities
  class Message

    attr_accessor :id, :title, :body

    def initialize(attributes)
      @id = attributes[:id]
      @title = attributes[:title]
      @body = attributes[:body]
    end

    def attributes
      instance_values.symbolize_keys
    end

  end
end
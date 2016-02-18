require "./lib/daos/message"
require "./lib/entities/message"

module Repositories
  class Message

    def initialize
      @dao_klass = DAOS::Message
    end

    def create(entity)
      dao = @dao_klass.create entity.attributes
      Entities::Message.new dao.attributes.symbolize_keys
    end

    def update(entity)
      dao = @dao_klass.find_by id: entity.id
      dao ? dao.update(entity.attributes) : false
    end

    def find_by(*args)
      dao = @dao_klass.find_by *args
      Entities::Message.new dao.attributes.symbolize_keys if dao
    end

    def delete(entity)
      dao = @dao_klass.find_by id: entity.id
      dao ? Entities::Message.new(dao.destroy.attributes.symbolize_keys) : false
    end

  end
end
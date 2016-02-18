require "active_record"
require "sqlite3"

module DAOS

  class Message < ActiveRecord::Base

    self.table_name = :messages

  end

end

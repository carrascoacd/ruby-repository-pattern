require "active_record"

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string  :title
      t.string  :body
    end
  end
end
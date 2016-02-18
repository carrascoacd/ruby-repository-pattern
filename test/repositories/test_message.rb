require "minitest/autorun"
require "./lib/repositories/message"

class Repositories::MessageTest < Minitest::Test

  def setup
    @repository = Repositories::Message.new
    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/test.sqlite3')
  end

  def test_update_ok
    dao = DAOS::Message.create(body: 'Testing')
    entity = Entities::Message.new(dao.attributes.symbolize_keys)
    entity.body = 'Modified'

    assert_equal true, @repository.update(entity)
    dao.reload
    assert_equal 'Modified', dao.body

    dao.destroy
  end

  def test_update_fail
    dao = DAOS::Message.create(body: 'Testing')
    entity = Entities::Message.new(body: 'Modified')

    assert_equal false, @repository.update(entity)
    dao.reload
    assert_equal 'Testing', dao.body

    dao.destroy
  end

  def test_create_ok
    entity = Entities::Message.new(body: 'Testing')

    assert_equal 'Testing', @repository.create(entity).body
    dao = DAOS::Message.last
    assert_equal true, dao.persisted?

    dao.destroy
  end

  def test_delete_ok
    dao = DAOS::Message.create(body: 'Testing')
    entity = Entities::Message.new(dao.attributes.symbolize_keys)

    assert_equal 'Testing', @repository.delete(entity).body
    assert_equal nil, DAOS::Message.find_by(id: entity.id)
  end

  def test_delete_fail
    entity = Entities::Message.new(body: 'Testing', id: 10)

    assert_equal false, @repository.delete(entity)
    assert_equal nil, DAOS::Message.find_by(id: entity.id)
  end

  def test_find_by_ok
    dao = DAOS::Message.create(body: 'Testing')
    entity = Entities::Message.new(id: dao.id)

    assert_equal 'Testing', @repository.find_by(id: entity.id).body

    dao.destroy
  end

  def test_find_by_fail
    dao = DAOS::Message.create(body: 'Testing')
    entity = Entities::Message.new(id: -1)

    assert_equal nil, @repository.find_by(id: entity.id)

    dao.destroy
  end

end
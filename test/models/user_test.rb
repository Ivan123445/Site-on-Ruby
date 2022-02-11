require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save empty model" do
    assert_not User.new.save
  end

  test "should save correct model" do
    assert User.new(email: "test@test.com", name: "New Name", password_digest: Faker::Lorem.word).save
  end

  test "should find data" do
    assert User.find_by(name: 'Test1')
  end

  test "should not find data" do
    assert_not User.find_by(name: 'Example2')
  end
end

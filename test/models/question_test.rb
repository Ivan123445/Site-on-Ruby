require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "should not save empty model" do
    assert_not Question.new.save
  end

  test "should save correct model" do
    assert Question.new(title: "New title", body: "New Body", created_at: Time.now, updated_at: Time.now, user_id: 2).save
  end

  test "should find data" do
    assert Question.find_by(body: 'Example')
  end

  test "should not find data" do
    assert_not Question.find_by(body: 'Example2')
  end
end

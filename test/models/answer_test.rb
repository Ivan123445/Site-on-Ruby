require "test_helper"

class AnswerTest < ActiveSupport::TestCase

  test "should not save empty model" do
    assert_not Answer.new.save
  end

  test "should save correct model" do
    assert_not Answer.new(body: "New Body", created_at: Time.now, updated_at: Time.now, question_id: 1).save
  end

  test "should find data" do
    assert Answer.find_by(body: 'Example')
  end

  test "should not find data" do
    assert_not Answer.find_by(body: 'Example2')
  end
end

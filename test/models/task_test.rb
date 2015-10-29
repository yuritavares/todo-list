require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'require a title' do
    task = Task.create(title: '')
    assert task.errors[:title].any?
  end

  test 'require a user' do
    task = Task.create(user: nil)
    assert task.errors[:user].any?
  end
end

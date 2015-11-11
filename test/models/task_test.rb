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

  test 'detects tasks as completed' do
    task = Task.new(completed_at: Time.current)

    assert task.completed?
    refute task.pending?
    assert_equal 'completed', task.status
  end

    test 'detects tasks as pending' do
    task = Task.new(completed_at: nil)

    refute task.completed?
    assert task.pending?
    assert_equal 'pending', task.status
  end

  test 'sort by pending' do
    tasks = Task.sort_by_pending.to_a

    assert_equal [tasks(:pending), tasks(:completed)], tasks
  end
end

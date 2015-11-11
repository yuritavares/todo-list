require 'test_helper'

class TaskStatusTest < ActiveSupport::TestCase
  test 'mark test as completed' do
    user = users(:john)
    tasks = [tasks(:pending), tasks(:completed)]

    # tasks_id = tasks.map {|t| t.id}
    tasks_ids = tasks.map(&:id)

    TaskStatus.update(user, tasks_ids)

    assert_equal 2, Task.where.not(completed_at: nil).count
  end

  test 'mark test as pending' do
    user = users(:john)
    tasks_ids = []

    TaskStatus.update(user, tasks_ids)

    assert_equal 2, Task.where(completed_at: nil).count
  end
end

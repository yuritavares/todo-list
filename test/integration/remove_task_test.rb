require 'test_helper'

class RemoveTaskTest < ActionDispatch::IntegrationTest
  test 'remove task' do
    user = users(:john)
    task = tasks(:pending)
    login_as(user)

    visit tasks_path
    within '.tasks > .task:first-child' do
      click_link t('actions.remove')
    end

    click_button button('task.remove')
  end
end

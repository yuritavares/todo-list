require 'test_helper'

class CreateTaskTest < ActionDispatch::IntegrationTest
  test 'with a valid data' do
    user = users(:john)
    login_as(user)

    visit tasks_path
    fill_in label('task.title'), with: 'Some task'
    click_button button('task.create')

    assert_equal tasks_path, current_path
    assert page.has_text?(notice('tasks.create'))
    assert page.has_text?('Some task')
  end

  test 'with invalid data' do
    user = users(:john)
    login_as(user)

    visit tasks_path
    click_button button('task.create')

    assert_equal tasks_path, current_path
    assert page.has_text?(alert('tasks.create'))
  end
end

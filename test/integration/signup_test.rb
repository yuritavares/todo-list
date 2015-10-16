require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with a valid data' do
    visit root_path
    click_link t('menu.signup')

    fill_in label('user.name'),   with: 'John Doe'
    fill_in label('user.email'),   with: 'john.doe@example.com'
    fill_in label('user.password'),    with: 'testtest'
    fill_in label('user.password_confirmation'), with: 'testtest'
    check label('user.tos')
    click_button button('user.create')

    assert_equal login_path, current_path
    assert  page.has_text?(notice('signup.create'))
  end

  test 'with a invalid data' do
    visit root_path
    click_link t('menu.signup')
    click_button button('user.create')

    assert_equal signup_path, current_path
    assert page.has_text?(form_error)
  end
end

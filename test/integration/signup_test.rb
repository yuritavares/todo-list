require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test 'with a valid data' do
    visit '/'
    click_link 'Cadastre-se'

    fill_in 'Seu nome',   with: 'John Doe'
    fill_in 'Seu e-mail',   with: 'john.doe@example.com'
    fill_in 'Sua senha',    with: 'testtest'
    fill_in 'Confirme sua senha', with: 'testtest'
    check 'Concordo com os termos de serviço'
    click_button 'Criar minha conta'

    assert_equal '/login', current_path
    assert  page.has_text?("Casdastro realizado com sucesso!")
  end

  test 'with a invalid data' do
    visit '/'
    click_link 'Cadastre-se'
    click_button 'Criar minha conta'

    assert_equal '/signup', current_path
    assert page.has_text?('Verifique o formulário antes de continuar')
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'requires name' do
    user = User.create(name: '')
    assert user.errors[:name].any?
  end

  test 'requires e-mail' do
    user = User.create(email: '')
    assert user.errors[:email].any?
  end

  %W[
    invalid
    a@a
    a@a.a
    a..@example.org
    a..a@example.org
  ].each do |email|
    test "requires a valid e-mail (#{email})" do
      user = User.create(email: email)
      assert user.errors[:email].any?
    end
  end

  %W[
    john@example.com
    john.doe@example.com
    jhon_doe@example.com
    jhon@sub.example.com
    john@example-domain.com
    jhon@example.io
    john@example.com.br
    john@example.co.uk
    john+spam@example.com
    JOHN@EXAMPLE.COM
  ].each do |email|
    test "Accepts valid e-mail (#{email})" do
      user = User.create(email: email)
      assert user.errors[:email].empty?
    end
  end

  test 'requires password' do
    user = User.create(password: '')
    assert user.errors[:password].any?
  end

  test 'requires password confirmation' do
    user = User.create(password: 'test', password_confirmation: 'invalid')
    assert user.errors[:password_confirmation].any?
  end

  test 'requires  acceptance of terms of service' do
    user = User.create(tos: false)
    assert user.errors[:tos].any?
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/new.html.erb' do
  let(:user) { FactoryBot.build(:user) }

  before do
    assign(:user, user)
    render
  end

  it 'displays the sign-up form with correct fields' do
    assert_select 'h1', text: 'Sign Up'

    assert_select "form[method='post'][action='#{users_path}']" do
      assert_select 'div.alert.alert-danger', count: 0

      assert_select 'fieldset' do
        assert_select 'legend', text: 'User Information'

        assert_select 'div.form-group' do
          assert_select 'label[for=user_first_name]', text: 'First Name'
          assert_select 'input[type=text][name="user[first_name]"]'
        end

        assert_select 'div.form-group' do
          assert_select 'label[for=user_last_name]', text: 'Last Name'
          assert_select 'input[type=text][name="user[last_name]"]'
        end

        assert_select 'div.form-group' do
          assert_select 'label[for=user_pronouns]', text: 'Pronouns'
          assert_select 'input[type=text][name="user[pronouns]"]'
        end

        assert_select 'div.form-group' do
          assert_select 'label[for=user_email]', text: 'Email'
          assert_select 'input[type=email][name="user[email]"]'
        end

        assert_select 'div.form-group' do
          assert_select 'label[for=user_password]', text: 'Password'
          assert_select 'input[type=password][name="user[password]"]'
        end
      end

      assert_select "input[type='submit'][value='Submit']"
    end
  end

  it 'renders the link to login' do
    assert_select "a[href='#{login_path}']", text: 'Login'
  end
end

require 'rails_helper'

describe OmniauthCallbacksController, type: :controller do
  before do
    OmniAuth.config.mock_auth[:google] = nil
    OmniAuth.config.test_mode = true
    request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google] =
      OmniAuth::AuthHash.new(
        "provider" => "google_oauth2",
         "uid" => "100000000000000",
         "info" => {
           "name" => "John Smith",
           "email" => "john@example.com",
           "first_name" => "John",
           "last_name" => "Smith",
           "image" => "https://lh4.googleusercontent.com/photo.jpg"
         },
         "credentials" => {
           "token" => "TOKEN",
           # "refresh_token" => "REFRESH_TOKEN",
           "expires_at" => 1_496_120_719,
           "expires" => true
          }
      )
  end

  describe 'GET google_oauth2' do
    let(:data) { request.env['omniauth.auth'].info }

    context 'when user does not exist yet' do
      it 'create with datas from Google' do
        get :google_oauth2
        user = User.last
        expect(data.name.parameterize.underscore).to eq(user.username)
        expect(data.email).to eq(user.email)
        expect(data.first_name).to eq(user.first_name)
        expect(data.last_name).to eq(user.last_name)
        expect(data.image).to eq(user.avatar)
      end

      it 'authenticates the user from Google oauth' do
        get :google_oauth2
        data = request.env['omniauth.auth'].credentials
        expect(data.token).to eq('TOKEN')
        expect(data.expires_at).to eq(1_496_120_719)
      end

      it 'redirects to more information page' do
        get :google_oauth2
        expect(response).to redirect_to(user_informations_path(User.first))
      end
    end

    context 'when user is already created' do
      it 'redirect to user\'s home page' do
        user = create(:user, email: 'john@example.com', created_at: '2014-09-19 07:03:30 -0300')
        get :google_oauth2
        expect(response).to redirect_to(user_url(user))
      end
    end
  end
  # TODO: test failure cases
  # describe 'GET failure' do
  # end
end

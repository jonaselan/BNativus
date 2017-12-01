require 'rails_helper'

RSpec.describe Users::InformationsController, type: :controller do
  let(:current_user) { subject.current_user }
  let(:valid_attributes) { attributes_for(:user) }

  describe "GET #index" do
    login_user
    it "build the two type of language on current user" do
      get :index, params: { user_id: current_user.id, locale: I18n.locale }
      expect(current_user.user_languages_studieds.empty?).to be_falsy
      expect(current_user.user_known_languages.empty?).to be_falsy
    end
  end

  describe "PATCH #update" do
    login_user
    context "with valid params" do
      let(:new_attributes) do
        { country: "sim" }
      end
      before do
        put :update, params: { id: current_user.id, user_id: current_user.id,
                               user: new_attributes, locale: I18n.locale }
        current_user.reload
      end

      it "updates the requested user" do
        expect(current_user.country).to eq('sim')
      end

      it "redirects to the user" do
        expect(response).to redirect_to user_path(current_user.id)
      end
    end
  end
end

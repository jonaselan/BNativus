require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:current_user) { subject.current_user }
  let(:language) { create(:language) }
  let(:valid_attributes) { { link: "MyString", level: "MyString", language_id: language.id } }
  let(:invalid_attributes) { attributes_for(:room, link: '') }

  describe "POST #create" do
    login_user
    context "with valid params" do
      it "creates a new Room" do
        expect do
          post :create, params: { room: valid_attributes, locale: I18n.locale }
        end.to change(Room, :count).by(1)
      end
      it "creates a new Room with ip related" do
        post :create, params: { room: valid_attributes, locale: I18n.locale }
        expect(Room.last.ip).to eq request.remote_ip
      end
      it "creates a new Room with user related" do
        post :create, params: { room: valid_attributes, locale: I18n.locale }
        expect(Room.last.user).to eq current_user
      end
      it "increment a rooms number of current user" do
        post :create, params: { room: valid_attributes, locale: I18n.locale }
        expect(current_user.created_rooms).to eq 1
      end
    end
  end
end

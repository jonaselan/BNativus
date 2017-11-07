require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:valid_attributes) {{ link: "MyString", level: "MyString" }}
  let(:invalid_attributes) { attributes_for(:room, link: '') }

  # FIXME: ActionController::UrlGenerationError
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, params: {room: valid_attributes}
        }.to change(Room, :count).by(1)
      end
      it "creates a new Room with ip related" do
        post :create, params: {room: valid_attributes}
        expect(Room.last.ip).to eq request.remote_ip
      end
      it "creates a new Room with user related" do
        post :create, params: {room: valid_attributes}
        expect(Room.last.user).to eq current_user
      end
    end
  end
end

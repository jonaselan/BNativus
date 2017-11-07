require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoomsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      room = Room.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      room = Room.create! valid_attributes
      get :show, params: {id: room.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      room = Room.create! valid_attributes
      get :edit, params: {id: room.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Room" do
        expect {
          post :create, params: {room: valid_attributes}, session: valid_session
        }.to change(Room, :count).by(1)
      end

      it "redirects to the created room" do
        post :create, params: {room: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Room.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {room: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested room" do
        room = Room.create! valid_attributes
        put :update, params: {id: room.to_param, room: new_attributes}, session: valid_session
        room.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the room" do
        room = Room.create! valid_attributes
        put :update, params: {id: room.to_param, room: valid_attributes}, session: valid_session
        expect(response).to redirect_to(room)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        room = Room.create! valid_attributes
        put :update, params: {id: room.to_param, room: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested room" do
      room = Room.create! valid_attributes
      expect {
        delete :destroy, params: {id: room.to_param}, session: valid_session
      }.to change(Room, :count).by(-1)
    end

    it "redirects to the rooms list" do
      room = Room.create! valid_attributes
      delete :destroy, params: {id: room.to_param}, session: valid_session
      expect(response).to redirect_to(rooms_url)
    end
  end

end

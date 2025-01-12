require 'rails_helper'

RSpec.describe DoctorAvailability::SlotsController, type: :controller do
  routes { DoctorAvailability::Engine.routes }

  let(:valid_attributes) { attributes_for(:doctor_availability_slot) }
  let(:invalid_attributes) { valid_attributes.merge(doctor_name: nil) }

  describe "GET /doctor_availability/slots" do
    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it 'returns JSON formatted response' do
      get :index, format: :json
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe "GET /doctor_availability/slots/available" do
    before do
      # Clear any existing slots
      DoctorAvailability::Slot.destroy_all
      
      # Create one available and one reserved slot
      @available_slot = create(:doctor_availability_slot, is_reserved: false)
      @reserved_slot = create(:doctor_availability_slot, is_reserved: true)
    end

    it "returns only available slots" do
      get :available, format: :json

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(1)
      expect(json_response.first["id"]).to eq(@available_slot.id)
    end
  end

  describe "POST /doctor_availability/slots" do
    context "with valid parameters" do
      it "creates a new slot" do
        expect {
          post :create, params: { slot: valid_attributes }, format: :json
        }.to change(DoctorAvailability::Slot, :count).by(1)
      end

      it "returns a success response" do
        post :create, params: { slot: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new slot" do
        expect {
          post :create, params: { slot: invalid_attributes }, format: :json
        }.not_to change(DoctorAvailability::Slot, :count)
      end

      it "returns an error response" do
        post :create, params: { slot: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

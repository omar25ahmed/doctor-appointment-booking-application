require 'rails_helper'

RSpec.describe "DoctorAvailability::Slots", type: :request do
  let(:valid_attributes) { attributes_for(:doctor_availability_slot) }
  let(:headers) { { 
    'CONTENT_TYPE' => 'application/json',
    'HTTP_ACCEPT' => 'application/json'
  } }

  describe "GET /doctor_availability/slots" do
    it "returns all slots" do
      slot = create(:doctor_availability_slot)
      get "/doctor_availability/slots", params: { format: :json }, headers: headers

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.first["doctor_id"]).to eq(slot.doctor_id)
      expect(json_response.first["doctor_name"]).to eq(slot.doctor_name)
      expect(json_response.first["cost"].to_f).to eq(slot.cost)
      expect(json_response.first["is_reserved"]).to eq(slot.is_reserved)
    end
  end

  describe "GET /doctor_availability/slots/available" do
    before do
      @available_slot = create(:doctor_availability_slot, is_reserved: false)
      @reserved_slot = create(:doctor_availability_slot, is_reserved: true)
    end

    it "returns only available slots" do
      get "/doctor_availability/slots/available", params: { format: :json }, headers: headers

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
          post "/doctor_availability/slots", 
               params: { slot: valid_attributes, format: :json }.to_json,
               headers: headers
        }.to change(DoctorAvailability::Slot, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new slot" do
        expect {
          post "/doctor_availability/slots", 
               params: { slot: valid_attributes.merge(doctor_name: nil), format: :json }.to_json,
               headers: headers
        }.not_to change(DoctorAvailability::Slot, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /doctor_availability/slots/:id" do
    let(:slot) { create(:doctor_availability_slot) }

    context "with valid parameters" do
      it "updates the requested slot" do
        put "/doctor_availability/slots/#{slot.id}", 
            params: { slot: { doctor_name: "Dr. Jones" }, format: :json }.to_json,
            headers: headers

        expect(response).to have_http_status(:ok)
        slot.reload
        expect(slot.doctor_name).to eq("Dr. Jones")
      end
    end

    context "with invalid parameters" do
      it "returns an error response" do
        put "/doctor_availability/slots/#{slot.id}", 
            params: { slot: { doctor_name: nil }, format: :json }.to_json,
            headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /doctor_availability/slots/:id" do
    it "destroys the requested slot" do
      slot = create(:doctor_availability_slot)
      expect {
        delete "/doctor_availability/slots/#{slot.id}", params: { format: :json }, headers: headers
      }.to change(DoctorAvailability::Slot, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end

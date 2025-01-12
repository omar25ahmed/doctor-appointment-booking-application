module DoctorAvailability
  class SlotsController < DoctorAvailability::ApplicationController
    before_action :set_slot, only: [:show, :update, :destroy]

    def index
      Rails.logger.debug "Headers: #{request.headers.to_h}"
      Rails.logger.debug "Params: #{params.inspect}"
      @slots = DoctorAvailability.slot_service.list_slots
      render json: @slots
    end

    def show
      render json: @slot
    end

    def available
      Rails.logger.debug "Headers: #{request.headers.to_h}"
      Rails.logger.debug "Params: #{params.inspect}"
      @slots = DoctorAvailability.slot_service.list_available_slots
      render json: @slots
    end

    def create
      Rails.logger.debug "Headers: #{request.headers.to_h}"
      Rails.logger.debug "Params: #{params.inspect}"
      @slot = DoctorAvailability.slot_service.create_slot(slot_params)
      if @slot.save
        render json: @slot, status: :created
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def update
      Rails.logger.debug "Headers: #{request.headers.to_h}"
      Rails.logger.debug "Params: #{params.inspect}"
      if @slot.update(slot_params)
        render json: @slot
      else
        render json: @slot.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
      Rails.logger.debug "Headers: #{request.headers.to_h}"
      Rails.logger.debug "Params: #{params.inspect}"
      @slot.destroy
      head :no_content
    end

    private

    def set_slot
      @slot = DoctorAvailability.slot_service.find_slot(params[:id])
    end

    def slot_params
      params.require(:slot).permit(:time, :doctor_id, :doctor_name, :is_reserved, :cost)
    end
  end
end

module AppointmentBooking
  class AppointmentsController < ApplicationController
    def create
      book_appointment = UseCases::BookAppointment.new(AppointmentBooking.appointment_repository)
      
      appointment = book_appointment.execute(
        slot_id: params[:slot_id],
        patient_id: params[:patient_id],
        patient_name: params[:patient_name]
      )

      render json: appointment, status: :created
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end

    def index
      appointments = AppointmentBooking.appointment_repository.list_all
      render json: appointments
    end

    def show
      appointment = AppointmentBooking.appointment_repository.find(params[:id])
      if appointment
        render json: appointment
      else
        render json: { error: 'Appointment not found' }, status: :not_found
      end
    end
  end
end

module DoctorAvailability
  class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token, if: -> { Rails.env.test? || json_request? }

    protected

    def json_request?
      Rails.logger.debug "Content Type: #{request.content_type}"
      Rails.logger.debug "Format: #{request.format}"
      Rails.logger.debug "Headers: #{request.headers.to_h}"
      request.format.json? || request.content_type =~ /\Aapplication\/json/
    end
  end
end

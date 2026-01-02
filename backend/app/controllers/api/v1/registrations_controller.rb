module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json
      # Notice: configure_sign_up_params before_action is REMOVED
      
      private

      # Notice: configure_sign_up_params method is REMOVED 
      # because ApplicationController is handling it globally.

      def respond_with(resource, _opts = {})
        Rails.logger.debug "resource data: #{resource.inspect}"
        if resource.persisted?
          render json: {
            status: { code: 200, message: 'Signed up successfully.' },
            data: resource
          }, status: :ok
        else
          render json: {
            status: { 
              message: "User could not be created successfully. #{resource.errors.full_messages.to_sentence}" 
            }
          }, status: :unprocessable_entity
        end
      end
    end
  end
end
class Api::V1::SessionsController < Devise::SessionsController
  # This ensures we respond with JSON even if something goes wrong
  respond_to :json

  private

  # This method tells Devise how to respond when a user logs in successfully
  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: 'Logged in successfully.' },
      data: resource
    }, status: :ok
  end

  # This method tells Devise how to respond when a user logs out
  def respond_to_on_destroy
    render json: {
      status: 200,
      message: "Logged out successfully"
    }, status: :ok
  end
end
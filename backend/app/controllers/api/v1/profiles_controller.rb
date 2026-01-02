class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    # Later, you will fetch this from MariaDB via a Model
    # For now, let's return a hardcoded JSON response
    render json: {
      name: "#{current_user.first_name}",
      email: current_user.email,
      status: "Authenticated via JWT",
      settings: settings,
    }
  end

  # This allows us to receive data from Angular
  def update
    # For now, we'll just "echo" the data back to prove it worked
    # Later, you will do: @profile.update(profile_params)
    received_name = params[:name]
    received_status = params[:status]

    render json: {
      message: "Data received successfully!",
      updated_name: received_name,
      updated_status: received_status
    }
  end

  def settings
    {
      theme: "dark",
      notifications: true,
      language: "en",
    }
  end


  private

  # Security measure: only allow these specific fields through
  def profile_params
    params.require(:profile).permit(:name, :status, :location)
  end
end

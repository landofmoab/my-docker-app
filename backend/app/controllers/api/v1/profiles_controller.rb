class Api::V1::ProfilesController < ApplicationController
  def show
    # Later, you will fetch this from MariaDB via a Model
    # For now, let's return a hardcoded JSON response
    render json: {
      name: "Landofmoab",
      status: "Developer is Online",
      location: "WSL/Docker Environment"
    }
  end
end

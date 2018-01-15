class OrganizationsController < ApplicationController
  def index
    @organizations = []
  end

  def create
    @organizations = Organization.create_or_update_from_pipefy_api

    render :index
  end
end

class PatchesController < ApplicationController
  def index
    render json: { patches: patches_response }
  end

  private

  def patches_response
    Patch.all.map { |patch| patch.attributes.slice(%w(link version)) }
  end
end

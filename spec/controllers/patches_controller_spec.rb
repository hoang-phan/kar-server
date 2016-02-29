require 'rails_helper'

RSpec.describe PatchesController, type: :controller do
  describe 'GET index' do
    let(:patches_response) do
      patches.map do |patch|
        patch.attributes.slice(*%w(link version))
      end
    end

    let!(:patches) { create_list(:patch, 2) }
    let(:json_response) { JSON(response.body) }

    it 'responds with all patches' do
      get :index
      expect(response).to be_success
      expect(json_response['patches']).to eq patches_response
    end
  end
end

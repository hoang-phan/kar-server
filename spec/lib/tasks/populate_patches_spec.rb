require 'rails_helper'
require 'rake'

describe 'csv' do
  describe ':populate_patches' do
    let(:csv) { "version,link\n20150201,http://link.url" }
    let(:patch) { Patch.last }
    subject { Rake::Task["csv:populate_patches"] }

    before do
      load File.expand_path("../../../../lib/tasks/populate_patches.rake", __FILE__)
      Rake::Task.define_task(:environment)
      allow_any_instance_of(Object).to receive(:open).with(ENV['patches_url']).and_return(double(read: csv))
    end

    it 'creates new patches from csv' do
      expect {
        subject.invoke
      }.to change(Patch, :count).by(1)
      expect(patch.link).to eq 'http://link.url'
      expect(patch.version).to eq 20150201
    end
  end
end

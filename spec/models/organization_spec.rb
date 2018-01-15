require 'rails_helper'

RSpec.describe Organization do
  describe '.create_or_update_from_pipefy_api' do
    it 'creates the organization and it\' structure' do
      stub_request(:post, "#{ENV['PIPEFY_URL']}/queries").to_return(
        body: load_fixture_file('requests/pipefy_organization.json'),
        headers: { 'Content-Type' => 'application/json' }
      )

      expect do
        described_class.create_or_update_from_pipefy_api
      end.to change(Organization, :count).by(1).
      and change(Pipe, :count).by(1).
      and change(Phase, :count).by(2).
      and change(Card, :count).by(1)
    end
  end
end

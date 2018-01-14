require 'rails_helper'

RSpec.describe OrganizationBuilder do
  describe '#create_from_response!' do
    it 'creates the organizations and nested models' do
      response = load_fixture_json('requests/pipefy_organization.json')

      expect do
        subject.create_from_response!(response)
      end.to change(Organization, :count).by(1).
      and change(Pipe, :count).by(1).
      and change(Phase, :count).by(2).
      and change(Card, :count).by(1)
    end

    it 'updates the data when it has already been fetched' do
      response = load_fixture_json('requests/pipefy_organization.json')

      subject.create_from_response!(response)

      response[:data][:organizations].first[:name] = 'test'

      expect do
        subject.create_from_response!(response)
      end.to change(Organization, :count).by(0).
      and change(Pipe, :count).by(0).
      and change(Phase, :count).by(0).
      and change(Card, :count).by(0)

      expect(Organization.last.name).to eq 'test'
    end
  end
end

def load_fixture_json(path)
  full_path = Rails.root.join('spec/fixtures', path)
  file = File.read(full_path)

  JSON.parse(file, symbolize_names: true)
end

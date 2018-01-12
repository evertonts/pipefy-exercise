require 'rails_helper'

RSpec.describe PipefyClient do
  describe 'query' do
    it 'returns the query result' do
      stub_request(:post, "#{ENV.fetch('PIPEFY_URL')}/queries").to_return(
        body: { data: { id: 1 } }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )

      response = subject.query({ "query" => "{ me { id } }" })

      expect(response[:data][:id]).to be 1
    end
  end
end

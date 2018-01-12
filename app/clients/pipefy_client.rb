class PipefyClient
  def query(params)
    response = connection.post('queries', params)

    if response.success?
      response.body.deep_symbolize_keys
    end
  end

  def connection
    @connection = Faraday.new(:url => ENV.fetch('PIPEFY_URL')) do |builder|
      builder.request :json
      builder.response :json, content_type: /\bjson$/
      builder.adapter  Faraday.default_adapter
      builder.authorization :Bearer, ENV.fetch('PIPEFY_TOKEN')
    end
  end
end

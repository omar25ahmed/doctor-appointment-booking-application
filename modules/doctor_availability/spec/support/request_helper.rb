module RequestHelper
  def json_response
    JSON.parse(response.body)
  end

  def json_headers
    {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json'
    }
  end
end

RSpec.configure do |config|
  config.include RequestHelper, type: :request
end

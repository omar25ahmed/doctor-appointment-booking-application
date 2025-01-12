module RequestSpecHelper
  def json_response
    JSON.parse(response.body)
  end

  def json_request_headers
    {
      'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json',
      'HTTP_X_REQUESTED_WITH' => 'XMLHttpRequest'
    }
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
end

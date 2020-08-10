# frozen_string_literal: true

def json_response(response)
  JSON.parse(response.body, symbolize_names: true)
end

# frozen_string_literal: true

require 'test_helper'

class GuitarTest < ActiveSupport::TestCase
  test "Create a Guitar" do
    guitar = Guitar.new(model: "Gibson", year: "1995", is_available: false)
    assert_equal guitar, guitar
  end

  test "Method Stolen" do
    guitar = Guitar.new(model: "Gibson", year: "1995", is_available: false)
    uri = URI.parse("https://calm-beach-16451.herokuapp.com/search?model=#{guitar.model}&year=#{guitar.year}")
    request = Net::HTTP::Get.new(uri)
    request['X-Access-Token'] = 'cTdYDb6gKOAa6jXoAgJzhYz9BYDpEKsKZdsv+i'
    req_options = {
      use_ssl: uri.scheme == 'https'
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    guitar.stolen = JSON.parse(response.body, symnbolize_names: true)['isStolen']
    assert_equal guitar.stolen, !(true || false)
  end
end

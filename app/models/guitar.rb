# frozen_string_literal: true

require 'net/http'
require 'open-uri'

# Classe do objeto Guitarras
class Guitar < ApplicationRecord
  before_create :create, if: :stolen?

  def stolen?
    uri = URI.parse("https://calm-beach-16451.herokuapp.com/search?model=#{model}&year=#{year}")
    request = Net::HTTP::Get.new(uri)
    request['X-Access-Token'] = 'cTdYDb6gKOAa6jXoAgJzhYz9BYDpEKsKZdsv+i'
    req_options = {
      use_ssl: uri.scheme == 'https'
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    self.stolen = JSON.parse(response.body, symnbolize_names: true)['isStolen']
  end
end

require "spamer/version"

require 'net/http'
require 'uri'
require 'json'
require 'digest'

module Spamer
  class Base
    SITE_NAME = 'atompark.com'
    BASE_PATH = '/api/sms/3.0/'

    def initialize(pub_key, pr_key, params = {})
      @pub_key = pub_key
      @pr_key = pr_key
      @params = params
    end

    def send_sms(phone, message, params = {})
      action = 'sendSMS'
      params = {
        sender: 'Info',
        datetime: '',
        sms_lifetime: 0,
        version: '3.0',
        action: action,
        phone: phone,
        text: message,
        key: @pub_key
      }.merge(@params).merge(params)

      params[:sum] = URI.encode(get_sum(params))
      send_request(action, params)
    end

    private

    def get_sum(params)
      str = Hash[params.sort].values.join('')
      str += @pr_key
      Digest::MD5.hexdigest(str)
    end

    def send_request(action, params)
      req = BASE_PATH
      req += action
      req += '?'
      req += URI.encode_www_form(params)

      response = Net::HTTP.get_response(SITE_NAME, req)
      JSON.parse(response.body)
    end
  end
end
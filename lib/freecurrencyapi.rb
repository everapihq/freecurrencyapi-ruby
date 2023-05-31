# frozen_string_literal: true

require 'rest-client'
require 'json'
require_relative "freecurrencyapi/version"
require_relative 'freecurrencyapi/endpoints'
require_relative 'freecurrencyapi/configuration'

module Freecurrencyapi
  BASE_URL = 'https://api.freecurrencyapi.com/v1/'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Freecurrencyapi::Configuration.new
    yield(configuration)
  end
end

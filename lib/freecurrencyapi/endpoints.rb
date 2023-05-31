module Freecurrencyapi
  class Endpoints

    attr_writer :apikey

    def initialize(options = {})
      @apikey = options[:apikey] || Freecurrencyapi.configuration.apikey
    end

    def status()
      @result = call_api('status?type=quota')
    end

    def currencies(currencies = '')
      @result = call_api(sprintf('currencies?currencies=%s', currencies))
    end

    def latest(baseCurrency = 'USD', currencies = '')
      @result = call_api(sprintf('latest?base_currency=%s&currencies=%s', baseCurrency, currencies))
    end

    def historical(date, baseCurrency = 'USD', currencies = '')
      @result = call_api(sprintf('historical?date=%s&base_currency=%s&currencies=%s', date, baseCurrency, currencies))
    end

    def call_api(route)
      begin
        @response = RestClient.get "#{Freecurrencyapi::BASE_URL}#{route}&apikey=#{@apikey}", { 'Accept' => 'application/json' }
      rescue RestClient::ExceptionWithResponse => e
        @data = e.response
      end
    end
  end
end

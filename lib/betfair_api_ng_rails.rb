require "betfair_api_ng_rails/version"

module BetfairApiNgRails

  module Api

    autoload :BaseParser,    'betfair_api_ng_rails/api/base_parser'
    autoload :BaseProvider,  'betfair_api_ng_rails/api/base_provider'
    autoload :BaseRequester, 'betfair_api_ng_rails/api/base_requester'

    module BF

      autoload :Config,         'betfair_api_ng_rails/api/bf/config'
      autoload :Constants,      'betfair_api_ng_rails/api/bf/constants'
      autoload :HttpRequester,  'betfair_api_ng_rails/api/bf/http_requester'
      autoload :HttpResponser,  'betfair_api_ng_rails/api/bf/http_responser'
      autoload :Provider,       'betfair_api_ng_rails/api/bf/provider'
      autoload :SessionManager, 'betfair_api_ng_rails/api/bf/session_manager'

      module Parsers

        module Soccer

          autoload :CompetitionParser, 'betfair_api_ng_rails/api/bf/parsers/soccer/competition_parser'

        end

      end

    end

    module Soccer

      autoload :Requester,            'betfair_api_ng_rails/api/soccer/requester'
      autoload :CompetitionRequester, 'betfair_api_ng_rails/api/soccer/competition_requester'

    end

  end

  def self.config(&block)
    @_config ||= BetfairApiNgRails::Api::BF::Config
    block_given? ? yield(@_config) : @_config
  end

end

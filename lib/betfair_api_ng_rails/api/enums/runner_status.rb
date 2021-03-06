module BetfairApiNgRails
  module Api
    module Enums
      class RunnerStatus
        extend Api::Enums::Concerns::Enumable

        enumify "ACTIVE",
                "WINNER",
                "LOSER",
                "REMOVED_VACANT",
                "REMOVED",
                "HIDDEN"

      end
    end
  end
end
module BanktoolsBR
  module Banks
    module Citybank
      class Agency
        include Utilities

        BANK_AGENCY_LENGTH = 4

        def initialize(bank_agency)
          @bank_agency = bank_agency
        end

        def valid?
          (sanitize_numbers(@bank_agency).length == BANK_AGENCY_LENGTH)
        end
      end
    end
  end
end

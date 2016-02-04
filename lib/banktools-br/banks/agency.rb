module BanktoolsBR
  module Banks
    class Agency
      include Utilities

      attr_reader :bank_agency

      def initialize(bank_agency)
        @bank_agency = bank_agency
      end

      def valid?
        (sanitize_numbers(bank_agency).length == bank_agency_length)
      end

      private

      def bank_agency_length
        4
      end
    end
  end
end

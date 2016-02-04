module BanktoolsBR
  module Banks
    class Agency
      include Utilities

      attr_reader :bank_agency

      # Constructs Agency class.
      #
      # @param [String] the bank agency number
      # @return the object
      def initialize(bank_agency)
        @bank_agency = bank_agency
      end

      # Validates the agency number based on their length.
      #
      # @return [true, false]
      def valid?
        (sanitize_numbers(bank_agency).length == bank_agency_length)
      end

      private

      # Sets the bank agency length.
      # Default: 4
      #
      # @!visibility private
      # @return [Integer] the bank agency length
      def bank_agency_length
        4
      end
    end
  end
end

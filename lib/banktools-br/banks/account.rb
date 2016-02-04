module BanktoolsBR
  module Banks
    class Account
      include Utilities

      attr_reader :bank_agency, :bank_account

      # Constructs Bank Account object.
      #
      # @param [String] bank agency number
      # @param [String] bank account number
      # @return the object
      def initialize(bank_agency, bank_account)
        @bank_agency = bank_agency
        @bank_account = bank_account
      end

      # Prettify account number, remove spaces, invalid numbers and fills with left zeros according to bank account length.
      #
      # @return [String] account number with digit
      def normalize
        account_number = sanitize_numbers(bank_account).rjust(bank_account_length, '0')

        [extract_number_without_digit(account_number, bank_account_length), extract_digit(bank_account)].join('-')
      end

      # Validates account number based on their length and verification digit.
      #
      # @return [true, false]
      def valid?
        (sanitize_numbers(bank_account).length == bank_account_length) &&
          (verification_digit == correct_verification_digit)
      end

      # Bank account number without digit
      #
      # @return [String]
      def bank_account_without_digit
        extract_number_without_digit(bank_account, bank_account_length)
      end

      # Full account number (bank_agency + bank_account_without_digit)
      #
      # @return [String]
      def full_account_number
        sanitize_numbers(bank_agency) + bank_account_without_digit
      end

      # Verification digit from account
      #
      # @return [String]
      def verification_digit
        extract_digit(bank_account)
      end

      private

      # Sets the bank account length.
      #
      # @!visibility private
      # @raise Not Implemented if main class method is called
      def bank_account_length
        raise 'Not Implemented, you must implement this method on child class'
      end

      # Calculates the correct verification digit for account.
      #
      # @!visibility private
      # @raise Not Implemented if main class method is called
      def correct_verification_digit
        raise 'Not Implemented, you must implement this method on child class'
      end
    end
  end
end

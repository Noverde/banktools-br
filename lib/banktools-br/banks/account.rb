module BanktoolsBR
  module Banks
    class Account
      include Utilities

      attr_reader :bank_agency, :bank_account

      def initialize(bank_agency, bank_account)
        @bank_agency = bank_agency
        @bank_account = bank_account
      end

      def to_s
        account_number = sanitize_numbers(bank_account).rjust(bank_account_length, '0')

        [extract_number_without_digit(account_number, bank_account_length), extract_digit(bank_account)].join('-')
      end

      def valid?
        (sanitize_numbers(bank_account).length == bank_account_length) &&
          (verification_digit == correct_verification_digit)
      end

      def bank_account_without_digit
        extract_number_without_digit(bank_account, bank_account_length)
      end

      def full_account_number
        sanitize_numbers(bank_agency) + bank_account_without_digit
      end

      def verification_digit
        extract_digit(bank_account)
      end

      private

      def bank_account_length
        raise 'Not Implemented, you must implement this method on child class'
      end

      def correct_verification_digit
        raise 'Not Implemented, you must implement this method on child class'
      end
    end
  end
end

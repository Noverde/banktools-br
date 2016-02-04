module BanktoolsBR
  module Banks
    module Bradesco
      class Account
        include Utilities

        BANK_ACCOUNT_LENGTH = 8

        def initialize(bank_agency, bank_account)
          @bank_agency = bank_agency
          @bank_account = bank_account
        end

        def verification_digit
          extract_digit(@bank_account)
        end

        def valid?
          (sanitize_numbers(@bank_account).length == BANK_ACCOUNT_LENGTH) &&
            (verification_digit == correct_verification_digit)
        end

        private

        def bank_account_without_digit
          extract_number_without_digit(@bank_account, BANK_ACCOUNT_LENGTH)
        end

        def correct_verification_digit
          sum_digit = digit_calculator_sum(bank_account_without_digit, [2, 7, 6, 5, 4, 3, 2], false)
          digit = sum_digit % 11

          return '0' if digit == 0
          return 'P' if digit == 1

          (11 - digit).to_s
        end
      end
    end
  end
end

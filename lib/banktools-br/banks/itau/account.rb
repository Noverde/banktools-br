module BanktoolsBR
  module Banks
    module Itau
      class Account
        include Utilities

        BANK_ACCOUNT_LENGTH = 6

        def initialize(bank_agency, bank_account)
          @bank_agency = bank_agency
          @bank_account = bank_account
        end

        def verification_digit
          extract_digit(@bank_account, BANK_ACCOUNT_LENGTH)
        end

        def valid?
          (sanitize_numbers(@bank_account).length == BANK_ACCOUNT_LENGTH) &&
            (verification_digit == correct_verification_digit)
        end

        private

        def bank_account_without_digit
          extract_number_without_digit(@bank_account, BANK_ACCOUNT_LENGTH)
        end

        def full_account_number
          sanitize_numbers(@bank_agency) + bank_account_without_digit
        end

        def correct_verification_digit
          digit = digit_calculator(full_account_number, [2, 1, 2, 1, 2, 1, 2, 1, 2], 10)

          return '0' if digit == 10

          digit.to_s
        end
      end
    end
  end
end

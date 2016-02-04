module BanktoolsBR
  module Banks
    module Santander
      class Account
        include Utilities

        BANK_ACCOUNT_LENGTH = 9

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

        def full_account_number
          sanitize_numbers(@bank_agency) + bank_account_without_digit
        end

        def correct_verification_digit
          sum_digit = digit_calculator_sum(full_account_number, [9, 7, 3, 1, 9, 7, 1, 3, 1, 9, 7, 3], false)
          digit = 10 - sum_digit.to_s.chars.last.to_i

          digit.to_s
        end
      end
    end
  end
end

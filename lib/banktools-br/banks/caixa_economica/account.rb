module BanktoolsBR
  module Banks
    module CaixaEconomica
      class Account
        include Utilities

        BANK_ACCOUNT_LENGTH = 12

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
          sum_digit = (digit_calculator_sum(full_account_number, [8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], false) * 10)
          div_digit = (sum_digit / 11)
          mul_digit = (div_digit * 11)

          digit = sum_digit - mul_digit

          return '0' if 10 == digit

          digit.to_s
        end
      end
    end
  end
end

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
          final_value = 0

          full_account_number.split('').each_with_index do |char, i|
            i = i + 1

            if i.odd?
              result = (char.to_i * 2)

              final_value += ((result > 9) ? (result.to_s[0].to_i + result.to_s[1].to_i) : result)
            else
              final_value += char.to_i
            end
          end

          mod = (final_value % 10)
          (mod == 0) ? '0' : (10 - mod).to_s
        end
      end
    end
  end
end

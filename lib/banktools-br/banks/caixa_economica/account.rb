module BanktoolsBR
  module Banks
    module CaixaEconomica
      class Account < BanktoolsBR::Banks::Account
        private

        # Sets the bank account length.
        #
        # @!visibility private
        # @return [Integer] the maximum bank account length
        def bank_account_length
          12
        end

        # Calculates the correct verification digit for account using mod 11
        #
        # @!visibility private
        # @return [String] the verification digit
        def correct_verification_digit
          sum_digit = (BanktoolsBR::Banks::DigitCalculator.new(full_account_number, [8, 7, 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]).sum_numbers * 10)
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

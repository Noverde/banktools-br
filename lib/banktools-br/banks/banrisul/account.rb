module BanktoolsBR
  module Banks
    module Banrisul
      class Account < BanktoolsBR::Banks::Account
        private

        # Sets the bank account length.
        #
        # @!visibility private
        # @return [Integer] the maximum bank account length
        def bank_account_length
          10
        end

        # Calculates the correct verification digit for account using mod 11
        #
        # @!visibility private
        # @return [String] the verification digit
        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(bank_account_without_digit, [3, 2, 4, 7, 6, 5, 4, 3, 2])
          digit = digit_calculator.sum_numbers % 11

          return '0' if digit == 0
          return '6' if digit == 1

          (11 - digit).to_s
        end
      end
    end
  end
end

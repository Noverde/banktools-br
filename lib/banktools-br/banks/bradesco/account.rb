module BanktoolsBR
  module Banks
    module Bradesco
      class Account < BanktoolsBR::Banks::Account
        private

        # Sets the bank account length.
        #
        # @!visibility private
        # @return [Integer] the maximum bank account length
        def bank_account_length
          8
        end

        # Calculates the correct verification digit for account using mod 11
        #
        # @!visibility private
        # @return [String] the verification digit
        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(bank_account_without_digit, [2, 7, 6, 5, 4, 3, 2])
          digit = digit_calculator.sum_numbers % 11

          return '0' if digit == 0
          return 'P' if digit == 1

          (11 - digit).to_s
        end
      end
    end
  end
end

module BanktoolsBR
  module Banks
    module Citybank
      class Account < BanktoolsBR::Banks::Account
        private

        def bank_account_length
          11
        end

        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(bank_account_without_digit, [11, 10, 9, 8, 7, 6, 5, 4, 3, 2])
          digit = digit_calculator.sum_numbers % 11

          return '0' if (digit == 0 || digit == 1)

          (11 - digit).to_s
        end
      end
    end
  end
end

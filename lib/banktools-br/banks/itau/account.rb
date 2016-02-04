module BanktoolsBR
  module Banks
    module Itau
      class Account < BanktoolsBR::Banks::Account
        private

        def bank_account_length
          6
        end

        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(full_account_number, [2, 1, 2, 1, 2, 1, 2, 1, 2])
          digit = digit_calculator.mod(10, true)

          return '0' if digit == 10

          digit.to_s
        end
      end
    end
  end
end

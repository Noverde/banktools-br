module BanktoolsBR
  module Banks
    module Santander
      class Account < BanktoolsBR::Banks::Account
        private

        def bank_account_length
          9
        end

        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(full_account_number, [9, 7, 3, 1, 9, 7, 1, 3, 1, 9, 7, 3])
          digit = 10 - digit_calculator.sum_numbers.to_s.chars.last.to_i

          digit.to_s
        end
      end
    end
  end
end

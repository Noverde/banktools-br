module BanktoolsBR
  module Banks
    module HSBC
      class Account < BanktoolsBR::Banks::Account
        private

        def bank_account_length
          7
        end

        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(full_account_number, [8, 9, 2, 3, 4, 5, 6, 7, 8, 9])
          digit = digit_calculator.sum_numbers % 11

          return '0' if (digit == 0 || digit == 10)

          digit.to_s
        end
      end
    end
  end
end

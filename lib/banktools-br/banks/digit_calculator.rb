module BanktoolsBR
  module Banks
    class DigitCalculator
      def initialize(string_number, weights)
        @string_number = string_number
        @weights = weights
      end

      def sum_numbers(sum_digits_when_greater_than_9 = false)
        raise BanktoolsBR::Banks::DigitWeightsInvalid, 'String number size is different from weight values size' if @string_number.size != @weights.size

        final_value = 0

        @string_number.chars.each_with_index do |char, i|
          result = char.to_i * @weights[i]

          if sum_digits_when_greater_than_9 && result > 9
            result = result.to_s[0].to_i + result.to_s[1].to_i
          end

          final_value += result
        end

        final_value
      end

      def mod(mod_number, sum_digits_when_greater_than_9 = false)
        (mod_number - (sum_numbers(sum_digits_when_greater_than_9) % mod_number))
      end
    end
  end
end

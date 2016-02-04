module BanktoolsBR
  module Banks
    class DigitCalculator
      # Constructs the digit calculator with string number and weights
      #
      # @param [String] full number with digit
      # @param [Array <Integer>] weight for each char from full number
      # @return the object
      def initialize(string_number, weights)
        @string_number = string_number
        @weights = weights
      end

      # Sum numbers with their weight and if sends sum_digits_when_greater_than_9 variable as true, the result of sum
      # should be sum the chars again.
      #
      # @param [true, false] the option to sum digits when result is greater than 9
      # @return [Integer]
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

      # Calculates the subtraction of mod number with sum numbers mod.
      #
      # @param [Integer] the mod number
      # @param [true, false] the option to sum digits when result is greater than 9
      # @return [Integer] result of mod subtract itself.
      def mod(mod_number, sum_digits_when_greater_than_9 = false)
        (mod_number - (sum_numbers(sum_digits_when_greater_than_9) % mod_number))
      end
    end
  end
end

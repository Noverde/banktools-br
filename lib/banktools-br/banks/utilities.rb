module BanktoolsBR
  module Banks
    module Utilities
      def sanitize_numbers(string_number)
        string_number.to_s.gsub(/[PX]$/i, '0').gsub(/[^0-9]/, '')
      end

      def extract_digit(full_number, maximum_size)
        sanitize_numbers(full_number).slice(maximum_size - 1, 1)
      end

      def extract_number_without_digit(full_number, maximum_size)
        sanitize_numbers(full_number).slice(0, maximum_size - 1)
      end

      def digit_calculator(string_number, weights, mod, sum_digits_when_greter_than_9 = true)
        raise BanktoolsBR::DigitWeightsInvalid, 'String number size is different from weight values size' if string_number.size != weights.size

        final_value = 0

        string_number.chars.each_with_index do |char, i|
          result = char.to_i * weights[i]

          if sum_digits_when_greter_than_9 && result > 9
            result = result.to_s[0].to_i + result.to_s[1].to_i
          end

          final_value += result
        end

        (mod - (final_value % mod))
      end
    end
  end
end

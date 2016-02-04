module BanktoolsBR
  module Banks
    module Utilities
      def sanitize_numbers(string_number)
        string_number.to_s.gsub(/[PX]$/i, '0').gsub(/[^0-9]/, '')
      end

      def extract_digit(full_number)
        full_number.to_s.chars.last.upcase
      end

      def extract_number_without_digit(full_number, maximum_size)
        sanitize_numbers(full_number).slice(0, maximum_size - 1)
      end
    end
  end
end

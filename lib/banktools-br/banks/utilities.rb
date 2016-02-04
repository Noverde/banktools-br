module BanktoolsBR
  module Banks
    module Utilities
      # Sanitizes string numbers with dashes, dots and non number verification digits.
      #
      # @param [String] full number with digit
      # @return [String] the string number sanitized
      def sanitize_numbers(string_number)
        string_number.to_s.gsub(/[PX]$/i, '0').gsub(/[^0-9]/, '')
      end

      # Extracts the last char for the string number.
      #
      # @param [String] full number with digit
      # @return [String] the verification digit from number
      def extract_digit(full_number)
        full_number.to_s.chars.last.upcase
      end

      # Extracts only the number without digit.
      #
      # @param [String] full number with digit
      # @param [Integer] maximum size of full number
      # @return [String] number without digit
      def extract_number_without_digit(full_number, maximum_size)
        sanitize_numbers(full_number).slice(0, maximum_size - 1)
      end
    end
  end
end

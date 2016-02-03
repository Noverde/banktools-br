require 'spec_helper'

class FakeBank
  include BanktoolsBR::Banks::Utilities
end

describe BanktoolsBR::Banks::Utilities do
  describe '#sanitize_numbers' do
    it 'removes spaces, special characters and changes P and X to 0 when is in the end of number' do
      expect(FakeBank.new.sanitize_numbers('01234')).to eq('01234')
      expect(FakeBank.new.sanitize_numbers('0123-4')).to eq('01234')
      expect(FakeBank.new.sanitize_numbers('0123P')).to eq('01230')
      expect(FakeBank.new.sanitize_numbers('0123X')).to eq('01230')
      expect(FakeBank.new.sanitize_numbers('  0123Xabc   ')).to eq('0123')
    end
  end

  describe '#extract_digit' do
    it 'returns the digit from account number' do
      expect(FakeBank.new.extract_digit('02939-1', 6)).to eq('1')
      expect(FakeBank.new.extract_digit('123452', 6)).to eq('2')
      expect(FakeBank.new.extract_digit('0293-1', 5)).to eq('1')
      expect(FakeBank.new.extract_digit('9877-5', 5)).to eq('5')
      expect(FakeBank.new.extract_digit('4456', 4)).to eq('6')
    end
  end

  describe '#extract_number_without_digit' do
    it 'returns the number from account number without digit' do
      expect(FakeBank.new.extract_number_without_digit('02939-1', 6)).to eq('02939')
      expect(FakeBank.new.extract_number_without_digit('123452', 6)).to eq('12345')
      expect(FakeBank.new.extract_number_without_digit('0293-1', 5)).to eq('0293')
      expect(FakeBank.new.extract_number_without_digit('9877-5', 5)).to eq('9877')
      expect(FakeBank.new.extract_number_without_digit('4456', 4)).to eq('445')
    end
  end

  describe '#digit_calculator' do
    it 'returns digit with mod 10' do
      expect(FakeBank.new.digit_calculator('093258054', [2, 1, 2, 1, 2, 1, 2, 1, 2], 10)).to eq(1)
      expect(FakeBank.new.digit_calculator('151451056', [2, 1, 2, 1, 2, 1, 2, 1, 2], 10)).to eq(7)
      expect(FakeBank.new.digit_calculator('782960085', [2, 1, 2, 1, 2, 1, 2, 1, 2], 10)).to eq(2)
    end

    it 'returns digit with mod 11' do
      expect(FakeBank.new.digit_calculator('00210169', [9, 8, 7, 6, 5, 4, 3, 2], 11, false)).to eq(6)
      expect(FakeBank.new.digit_calculator('01166281', [9, 8, 7, 6, 5, 4, 3, 2], 11, false)).to eq(6)
      expect(FakeBank.new.digit_calculator('00178780', [9, 8, 7, 6, 5, 4, 3, 2], 11, false)).to eq(2)
    end
  end
end

require 'spec_helper'

describe BanktoolsBR::Banks::DigitCalculator do
  describe '#sum_numbers' do
    it 'returns digit sum' do
      expect(described_class.new('093258054', [2, 1, 2, 1, 2, 1, 2, 1, 2]).sum_numbers(true)).to eq(39)
      expect(described_class.new('151451056', [2, 1, 2, 1, 2, 1, 2, 1, 2]).sum_numbers(true)).to eq(23)
      expect(described_class.new('782960085', [2, 1, 2, 1, 2, 1, 2, 1, 2]).sum_numbers(true)).to eq(38)
      expect(described_class.new('782960085', [2, 1, 2, 1, 2, 1, 2, 1, 2]).sum_numbers(false)).to eq(65)
    end
  end

  describe '#mod' do
    it 'returns digit according to mod calculation' do
      expect(described_class.new('093258054', [2, 1, 2, 1, 2, 1, 2, 1, 2]).mod(10, true)).to eq(1)
      expect(described_class.new('151451056', [2, 1, 2, 1, 2, 1, 2, 1, 2]).mod(10, true)).to eq(7)
      expect(described_class.new('782960085', [2, 1, 2, 1, 2, 1, 2, 1, 2]).mod(11, true)).to eq(6)
      expect(described_class.new('782960085', [2, 1, 2, 1, 2, 1, 2, 1, 2]).mod(11, false)).to eq(1)
    end
  end
end

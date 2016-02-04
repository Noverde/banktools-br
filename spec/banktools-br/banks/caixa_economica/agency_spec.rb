require 'spec_helper'

describe BanktoolsBR::Banks::CaixaEconomica::Agency do
  describe '#valid?' do
    it 'returns true if agency length is equal to 4' do
      expect(described_class.new('6540')).to be_valid
      expect(described_class.new('6722')).to be_valid
      expect(described_class.new('0920')).to be_valid
    end

    it 'returns false if agency length is not equal to 4' do
      expect(described_class.new('12345')).not_to be_valid
      expect(described_class.new('012')).not_to be_valid
      expect(described_class.new('99')).not_to be_valid
      expect(described_class.new('1')).not_to be_valid
    end
  end
end

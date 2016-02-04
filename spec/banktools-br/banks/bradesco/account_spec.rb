require 'spec_helper'

describe BanktoolsBR::Banks::Bradesco::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('3589', '1671144-6').verification_digit).to eq('6')
      expect(described_class.new('6695', '1945200-P').verification_digit).to eq('P')
      expect(described_class.new('3295', '04401093').verification_digit).to eq('3')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('1425', '0238.069-2')).to be_valid
        expect(described_class.new('6695', '0301.357-P')).to be_valid
        expect(described_class.new('3295', '0284.025-1')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('1425', '0238.069-3')).not_to be_valid
        expect(described_class.new('6695', '1945200-0')).not_to be_valid
        expect(described_class.new('3295', '04401094')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 8' do
        expect(described_class.new('0123', '123456789')).not_to be_valid
        expect(described_class.new('0123', '0124567')).not_to be_valid
        expect(described_class.new('0123', '012456')).not_to be_valid
        expect(described_class.new('0123', '0124')).not_to be_valid
        expect(described_class.new('0123', '456')).not_to be_valid
        expect(described_class.new('0123', '99')).not_to be_valid
        expect(described_class.new('0123', '1')).not_to be_valid
      end
    end
  end
end

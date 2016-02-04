require 'spec_helper'

describe BanktoolsBR::Banks::Santander::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('0189', '01017417-9').verification_digit).to eq('9')
      expect(described_class.new('0654', '02098733-1').verification_digit).to eq('1')
      expect(described_class.new('9974', '034221231').verification_digit).to eq('1')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('0189', '01017417-9')).to be_valid
        expect(described_class.new('1462', '483412014')).to be_valid
        expect(described_class.new('0153', '50824992-2')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('0189', '01017417-2')).not_to be_valid
        expect(described_class.new('1462', '483412013')).not_to be_valid
        expect(described_class.new('0153', '50824992-1')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 9' do
        expect(described_class.new('0123', '1234567890')).not_to be_valid
        expect(described_class.new('0123', '12345678')).not_to be_valid
        expect(described_class.new('0123', '1234567')).not_to be_valid
        expect(described_class.new('0123', '123456')).not_to be_valid
        expect(described_class.new('0123', '01245')).not_to be_valid
        expect(described_class.new('0123', '0124')).not_to be_valid
        expect(described_class.new('0123', '456')).not_to be_valid
        expect(described_class.new('0123', '99')).not_to be_valid
        expect(described_class.new('0123', '1')).not_to be_valid
      end
    end
  end
end

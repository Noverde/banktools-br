require 'spec_helper'

describe BanktoolsBR::Banks::Itau::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('1517', '664585').verification_digit).to eq('5')
      expect(described_class.new('0776', '05412-4').verification_digit).to eq('4')
      expect(described_class.new('7210', '048133').verification_digit).to eq('3')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('7210', '04813-3')).to be_valid
        expect(described_class.new('7153', '02688-0')).to be_valid
        expect(described_class.new('4533', '407104')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('0383', '81682-2')).not_to be_valid
        expect(described_class.new('1965', '36483-1')).not_to be_valid
        expect(described_class.new('0058', '41594-2')).not_to be_valid
        expect(described_class.new('2954', '11602-1')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 6' do
        expect(described_class.new('0123', '1234567')).not_to be_valid
        expect(described_class.new('0123', '01245')).not_to be_valid
        expect(described_class.new('0123', '0124')).not_to be_valid
        expect(described_class.new('0123', '456')).not_to be_valid
        expect(described_class.new('0123', '99')).not_to be_valid
        expect(described_class.new('0123', '1')).not_to be_valid
      end
    end
  end
end

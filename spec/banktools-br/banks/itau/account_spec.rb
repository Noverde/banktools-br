require 'spec_helper'

describe BanktoolsBR::Banks::Itau::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('8655', '138520').verification_digit).to eq('0')
      expect(described_class.new('0123', '15207-8').verification_digit).to eq('8')
      expect(described_class.new('6444', '12345-6').verification_digit).to eq('6')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('8655', '13852-0')).to be_valid
        expect(described_class.new('6458', '15207-8')).to be_valid
        expect(described_class.new('0393', '013529')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('8655', '13852-1')).not_to be_valid
        expect(described_class.new('6458', '15207-3')).not_to be_valid
        expect(described_class.new('0393', '01352-2')).not_to be_valid
        expect(described_class.new('0123', '12345-6')).not_to be_valid
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

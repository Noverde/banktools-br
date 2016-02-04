require 'spec_helper'

describe BanktoolsBR::Banks::HSBC::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('0007', '853838-6').verification_digit).to eq('6')
      expect(described_class.new('1996', '498991-4').verification_digit).to eq('4')
      expect(described_class.new('1913', '1040120').verification_digit).to eq('0')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('0007', '853838-6')).to be_valid
        expect(described_class.new('1996', '498991-4')).to be_valid
        expect(described_class.new('1913', '1040120')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('0007', '853838-7')).not_to be_valid
        expect(described_class.new('1996', '498991-5')).not_to be_valid
        expect(described_class.new('1913', '1040122')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 7' do
        expect(described_class.new('0123', '12345678')).not_to be_valid
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

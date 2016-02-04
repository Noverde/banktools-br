require 'spec_helper'

describe BanktoolsBR::Banks::Citybank::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('0075', '0007500465-8').verification_digit).to eq('8')
      expect(described_class.new('0001', '2000967610-4').verification_digit).to eq('4')
      expect(described_class.new('0062', '25748278669').verification_digit).to eq('9')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('0075', '0007500465-8')).to be_valid
        expect(described_class.new('0001', '2000967610-4')).to be_valid
        expect(described_class.new('0062', '25748278669')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('0075', '0007500465-2')).not_to be_valid
        expect(described_class.new('0001', '2000967610-1')).not_to be_valid
        expect(described_class.new('0062', '25748278665')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 11' do
        expect(described_class.new('0123', '123456789012')).not_to be_valid
        expect(described_class.new('0123', '0124567890')).not_to be_valid
        expect(described_class.new('0123', '012456')).not_to be_valid
        expect(described_class.new('0123', '0124')).not_to be_valid
        expect(described_class.new('0123', '456')).not_to be_valid
        expect(described_class.new('0123', '99')).not_to be_valid
        expect(described_class.new('0123', '1')).not_to be_valid
      end
    end
  end
end

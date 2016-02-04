require 'spec_helper'

describe BanktoolsBR::Banks::BB::Account do
  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('3944', '00037855-0').verification_digit).to eq('0')
      expect(described_class.new('1912', '011790997').verification_digit).to eq('7')
      expect(described_class.new('2088', '00144204-X').verification_digit).to eq('X')
    end
  end

  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('1584', '00210169-6')).to be_valid
        expect(described_class.new('5725', '01055025-9')).to be_valid
        expect(described_class.new('6549', '000122580')).to be_valid
        expect(described_class.new('5603', '00194776-1')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('0647', '01226990-7')).not_to be_valid
        expect(described_class.new('6627', '01273879-2')).not_to be_valid
        expect(described_class.new('0752', '01080443-5')).not_to be_valid
        expect(described_class.new('2071', '01248345-X')).not_to be_valid
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

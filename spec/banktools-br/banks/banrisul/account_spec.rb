require 'spec_helper'

describe BanktoolsBR::Banks::Banrisul::Account do
  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('2664', '35.850767.0-6')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('2664', '35.850767.0-3')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 10' do
        expect(described_class.new('0123', '12345678901')).not_to be_valid
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

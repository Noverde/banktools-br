require 'spec_helper'

describe BanktoolsBR::Banks::CaixaEconomica::Account do
  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('2004', '00100000448-6')).to be_valid
        expect(described_class.new('1278', '00118939153-0')).to be_valid
        expect(described_class.new('0805', '000519033171')).to be_valid
        expect(described_class.new('2933', '00197787120-3')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('2004', '00100000448-1')).not_to be_valid
        expect(described_class.new('1278', '00118939153-3')).not_to be_valid
        expect(described_class.new('0805', '000519033175')).not_to be_valid
        expect(described_class.new('2933', '00197787120-2')).not_to be_valid
      end
    end

    context 'when account length is invalid' do
      it 'returns false if account length is not equal to 12' do
        expect(described_class.new('0123', '1234567890123')).not_to be_valid
        expect(described_class.new('0123', '12345678901')).not_to be_valid
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

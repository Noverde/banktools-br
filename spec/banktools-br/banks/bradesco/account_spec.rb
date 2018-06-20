require 'spec_helper'

describe BanktoolsBR::Banks::Bradesco::Account do
  describe '#valid?' do
    context 'when account length is valid' do
      it 'returns true if verification digit is valid' do
        expect(described_class.new('0280', '10093929')).to be_valid
        expect(described_class.new('6695', '0301.357-P')).to be_valid
        expect(described_class.new('2185', '0033.765-0')).to be_valid
        expect(described_class.new('3295', '0284.025-1')).to be_valid
        expect(described_class.new('1425', '0238.069-2')).to be_valid
        expect(described_class.new('2876', '0617.774-3')).to be_valid
        expect(described_class.new('5991', '1270.565-4')).to be_valid
        expect(described_class.new('6476', '1457.280-5')).to be_valid
        expect(described_class.new('1202', '1795.852-6')).to be_valid
        expect(described_class.new('0230', '1047.206-7')).to be_valid
        expect(described_class.new('1350', '1974.973-8')).to be_valid
        expect(described_class.new('1598', '0683.270-9')).to be_valid
      end

      it 'returns false if verification digit is invalid' do
        expect(described_class.new('3295', '04401094')).not_to be_valid
        expect(described_class.new('0230', '1047.206-P')).not_to be_valid
        expect(described_class.new('1598', '0683.270-0')).not_to be_valid
        expect(described_class.new('1350', '1974.973-1')).not_to be_valid
        expect(described_class.new('1202', '1795.852-2')).not_to be_valid
        expect(described_class.new('1425', '0238.069-3')).not_to be_valid
        expect(described_class.new('6476', '1457.280-4')).not_to be_valid
        expect(described_class.new('2185', '0033.765-5')).not_to be_valid
        expect(described_class.new('3295', '0284.025-6')).not_to be_valid
        expect(described_class.new('6695', '0301.357-7')).not_to be_valid
        expect(described_class.new('2876', '0617.774-8')).not_to be_valid
        expect(described_class.new('5991', '1270.565-9')).not_to be_valid
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

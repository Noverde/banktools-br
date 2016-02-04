require 'spec_helper'

class FakeAccount < BanktoolsBR::Banks::Account
  private

  def bank_account_length
    8
  end
end

describe FakeAccount do
  describe '#normalize' do
    it 'returns account number with full number and left zeros' do
      expect(described_class.new('2644', '167.1144-6').normalize).to eq('1671144-6')
      expect(described_class.new('1222', '194.5200-P').normalize).to eq('1945200-P')
      expect(described_class.new('9974', '04401093').normalize).to eq('0440109-3')
    end
  end

  describe '#bank_account_without_digit' do
    it 'returns bank account removing the verification digit' do
      expect(described_class.new('3589', '1671144-6').bank_account_without_digit).to eq('1671144')
      expect(described_class.new('6695', '1945200-P').bank_account_without_digit).to eq('1945200')
      expect(described_class.new('3295', '04401093').bank_account_without_digit).to eq('0440109')
    end
  end

  describe '#verification_digit' do
    it 'returns extracted verification digit from account number' do
      expect(described_class.new('3589', '1671144-6').verification_digit).to eq('6')
      expect(described_class.new('6695', '1945200-P').verification_digit).to eq('P')
      expect(described_class.new('3295', '04401093').verification_digit).to eq('3')
    end
  end

  describe '#full_account_number' do
    it 'returns bank_agency + bank account removing the verification digit' do
      expect(described_class.new('3589', '1671144-6').full_account_number).to eq('35891671144')
      expect(described_class.new('6695', '1945200-P').full_account_number).to eq('66951945200')
      expect(described_class.new('3295', '04401093').full_account_number).to eq('32950440109')
    end
  end
end

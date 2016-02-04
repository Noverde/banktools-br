require 'spec_helper'

describe BanktoolsBR::Account do
  describe '#valid?' do
    let(:agency) { '0393' }
    let(:account) { '123456' }
    let(:bank_account) { double }

    it 'calls itau validation account if itau bank code' do
      expect(BanktoolsBR::Banks::Itau::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('341', agency, account).valid?
    end

    it 'calls bb validation account if bb bank code' do
      expect(BanktoolsBR::Banks::BB::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('001', agency, account).valid?
    end

    it 'calls caixa economica validation account if caixa economica bank code' do
      expect(BanktoolsBR::Banks::CaixaEconomica::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('104', agency, account).valid?
    end

    it 'calls santander validation account if santander bank code' do
      expect(BanktoolsBR::Banks::Santander::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('033', agency, account).valid?
    end

    it 'raises an exception if bank code does not match with any bank code supported' do
      expect { BanktoolsBR::Account.new('999', '0345', '013244-5').valid? }.to raise_error(BanktoolsBR::UnsupportedBank)
    end
  end
end

require 'spec_helper'

describe BanktoolsBR::Agency do
  describe '#valid?' do
    let(:agency) { '0393' }
    let(:bank_account) { double }

    it 'calls itau validation agency if itau bank code' do
      expect(BanktoolsBR::Banks::Itau::Agency).to receive(:new).with(agency).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Agency.new('341', agency).valid?
    end

    it 'calls bb validation agency if bb bank code' do
      expect(BanktoolsBR::Banks::BB::Agency).to receive(:new).with(agency).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Agency.new('001', agency).valid?
    end

    it 'calls caixa economica validation agency if caixa economica bank code' do
      expect(BanktoolsBR::Banks::CaixaEconomica::Agency).to receive(:new).with(agency).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Agency.new('104', agency).valid?
    end

    it 'calls santander validation agency if santander bank code' do
      expect(BanktoolsBR::Banks::Santander::Agency).to receive(:new).with(agency).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Agency.new('033', agency).valid?
    end

    it 'raises an exception if bank code does not match with any bank code supported' do
      expect { BanktoolsBR::Agency.new('999', '0345').valid? }.to raise_error(BanktoolsBR::UnsupportedBank)
    end
  end
end

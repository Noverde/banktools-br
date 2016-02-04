require 'spec_helper'

describe BanktoolsBR::Account do
  describe '#normalize' do
    let(:agency) { '0393' }
    let(:account) { '123456' }
    let(:bank_account) { double }

    it 'calls itau normalize account if itau bank code' do
      expect(BanktoolsBR::Banks::Itau::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('341', agency, account).normalize
    end

    it 'calls bb normalize account if bb bank code' do
      expect(BanktoolsBR::Banks::BB::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('001', agency, account).normalize
    end

    it 'calls caixa economica normalize account if caixa economica bank code' do
      expect(BanktoolsBR::Banks::CaixaEconomica::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('104', agency, account).normalize
    end

    it 'calls santander normalize account if santander bank code' do
      expect(BanktoolsBR::Banks::Santander::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('033', agency, account).normalize
    end

    it 'calls banrisul normalize account if banrisul bank code' do
      expect(BanktoolsBR::Banks::Banrisul::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('041', agency, account).normalize
    end

    it 'calls bradesco normalize account if bradesco bank code' do
      expect(BanktoolsBR::Banks::Bradesco::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('237', agency, account).normalize
    end

    it 'calls hsbc normalize account if hsbc bank code' do
      expect(BanktoolsBR::Banks::HSBC::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('399', agency, account).normalize
    end

    it 'calls normalize validation account if citybank bank code' do
      expect(BanktoolsBR::Banks::Citybank::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:normalize)

      BanktoolsBR::Account.new('745', agency, account).normalize
    end

    it 'raises an exception if bank code does not match with any bank code supported' do
      expect { BanktoolsBR::Account.new('999', '0345', '013244-5').valid? }.to raise_error(BanktoolsBR::UnsupportedBank)
    end
  end

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

    it 'calls banrisul validation account if banrisul bank code' do
      expect(BanktoolsBR::Banks::Banrisul::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('041', agency, account).valid?
    end

    it 'calls bradesco validation account if bradesco bank code' do
      expect(BanktoolsBR::Banks::Bradesco::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('237', agency, account).valid?
    end

    it 'calls hsbc validation account if hsbc bank code' do
      expect(BanktoolsBR::Banks::HSBC::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('399', agency, account).valid?
    end

    it 'calls citybank validation account if citybank bank code' do
      expect(BanktoolsBR::Banks::Citybank::Account).to receive(:new).with(agency, account).and_return(bank_account)
      expect(bank_account).to receive(:valid?)

      BanktoolsBR::Account.new('745', agency, account).valid?
    end

    it 'raises an exception if bank code does not match with any bank code supported' do
      expect { BanktoolsBR::Account.new('999', '0345', '013244-5').valid? }.to raise_error(BanktoolsBR::UnsupportedBank)
    end
  end
end

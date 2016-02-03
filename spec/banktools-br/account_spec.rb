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

    it 'raises an exception if bank code does not match with any bank code supported' do
      expect { BanktoolsBR::Account.new('999', '0345', '013244-5').valid? }.to raise_error(BanktoolsBR::UnsupportedBank)
    end
  end
end

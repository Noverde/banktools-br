module BanktoolsBR
  class Account
    def initialize(bank_code, bank_agency, bank_account)
      @bank_code = bank_code
      @bank_agency = bank_agency
      @bank_account = bank_account
    end

    def valid?
      case @bank_code
      when '001'
        BanktoolsBR::Banks::BB::Account.new(@bank_agency, @bank_account).valid?
      when '341'
        BanktoolsBR::Banks::Itau::Account.new(@bank_agency, @bank_account).valid?
      else
        raise BanktoolsBR::UnsupportedBank, "Bank: #{@bank_code} is not supported."
      end
    end
  end
end

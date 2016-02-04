require 'banktools-br/banks/digit_calculator'
require 'banktools-br/banks/utilities'
require 'banktools-br/banks/agency'
require 'banktools-br/banks/account'
require 'banktools-br/banks/itau'
require 'banktools-br/banks/bb'
require 'banktools-br/banks/caixa_economica'
require 'banktools-br/banks/santander'
require 'banktools-br/banks/banrisul'
require 'banktools-br/banks/bradesco'
require 'banktools-br/banks/hsbc'
require 'banktools-br/banks/citybank'

module BanktoolsBR
  module Banks
    class DigitWeightsInvalid < StandardError ; end
  end
end

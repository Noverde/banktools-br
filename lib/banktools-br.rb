require 'banktools-br/version'
require 'banktools-br/banks'
require 'banktools-br/account'
require 'banktools-br/agency'

module BanktoolsBR
  class UnsupportedBank < StandardError ; end
end

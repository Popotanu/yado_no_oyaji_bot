# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'uri'
require 'yaml'
require 'open-uri'
require 'faraday'

require_relative 'yado_no_oyaji_bot/config'

module YadoNoOyajiBot
  bot = Discordrb::Commands::CommandBot.new(
    #initialize

  )
end



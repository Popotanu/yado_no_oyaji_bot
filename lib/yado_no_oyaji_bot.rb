# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
Dotenv.load

require 'uri'
require 'yaml'
require 'erb'
require 'open-uri'
require 'faraday'


module YadoNoOyajiBot

require_relative 'yado_no_oyaji_bot/setting'
SETTINGS = Settings.new

Dir[File.dirname(__FILE__), 'yado_no_oyaji_bot', '*rb'].join(',').each { |f| require f }

  bot = Discordrb::Commands::CommandBot.new(
    token: SETTINGS.token,
    client_id: SETTINGS.client_id
  )
end




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

require_relative 'yado_no_oyaji_bot/config'

settings = Settings.new


  bot = Discordrb::Commands::CommandBot.new(
    #initialize

  )
end



# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
Dotenv.load

require 'uri'
require 'yaml'
require 'erb'
require 'open-uri'


module YadoNoOyajiBot
  LOGGER =  Discordrb::Logger.new(nil, [STDOUT])

  require_relative 'bot/setting'
  SETTINGS = Settings.new

  Dir["#{__dir__}/bot/*.rb"].each { |f| require f }

  BOT = Discordrb::Commands::CommandBot.new(
    token: SETTINGS.token,
    client_id: SETTINGS.client_id
  )

  LOGGER.info "oyaji: おはよう、やっと起きてきたか"
  LOGGER.info "Ctrl+C to stop the oyaji"

  BOT.message(content: 'こんにちは') do |e|
    e.respond('こんばんは')
  end

  BOT.run
end




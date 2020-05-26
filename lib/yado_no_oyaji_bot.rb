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
  LOGGER =  Discordrb::Logger.new(nil, [STDOUT])

  require_relative 'yado_no_oyaji_bot/setting'
  SETTINGS = Settings.new

  Dir[File.dirname(__FILE__), 'yado_no_oyaji_bot', '*rb'].join(',').each { |f| require f }

  BOT = Discordrb::Commands::CommandBot.new(
    token: SETTINGS.token,
    client_id: SETTINGS.client_id
  )

  at_exit do
    LOGGER.info "oyaji: 俺は寝るよ。おやすみ"
    exit!
  end

  LOGGER.info "oyaji: おはよう、やっと起きてきたか"
  LOGGER.info "Ctrl+C to stop the oyaji"
   bot.message(content: 'こんにちは') do |e|
   e.respond('nemui')
  end

  BOT.run(:async)
end




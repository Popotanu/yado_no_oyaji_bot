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
  LOGGER = Discordrb::Logger.new(nil, [STDOUT])

  require_relative 'bot/setting'
  SETTINGS = Settings.new

  Dir["#{__dir__}/bot/*.rb"].each { |f| require f }

  COMMAND_PREFIX = '!'
  BOT = Discordrb::Commands::CommandBot.new(
    token: SETTINGS.token,
    client_id: SETTINGS.client_id,
    prefix: COMMAND_PREFIX
  )

  Commands.include_all!

  LOGGER.info "oyaji: おはよう、やっと起きてきたか"
  LOGGER.info "Ctrl+C to stop the oyaji"

  BOT.message(content: 'こんにちは') do |e|
    e.respond('こんばんは' + e.user.name)
  end

  BOT.command :user do |event|
    event.user.name
  end

  BOT.run
end




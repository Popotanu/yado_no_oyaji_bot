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

  Dir["#{__dir__}/bot/*.rb"].sort.each { |f| require f }

  BOT = Discordrb::Commands::CommandBot.new(
    token: SETTINGS.token,
    client_id: SETTINGS.client_id,
    prefix: SETTINGS.command_prefix
  )

  Commands.include_all!

  LOGGER.info 'oyaji: おはよう、やっと起きてきたか'
  LOGGER.info 'Ctrl+C to stop the oyaji'

  BOT.message(content: 'おはよう') do |e|
    e.respond('おはよう' + e.user.name)
  end

  BOT.command(:hello, usage: 'tanu') do |event|
    "おはよう。#{event.user.name}。"
  end

  BOT.run
end

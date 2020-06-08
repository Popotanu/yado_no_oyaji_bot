# frozen_string_literal: true

module YadoNoOyajiBot
  module Commands
    module Dice
      # TODO: 依存をうまいこと管理しながらSETTINGS.command_prefixを暗黙のうちに使用可能にしたい
      require_relative '../setting'
      COMMAND_PREFIX ||= Settings.new.command_prefix

      extend Discordrb::Commands::CommandContainer
      command(:dice,
              description: 'ダイスふるよ！',
              usage: "#{COMMAND_PREFIX}dice 2d6",
              min_args: 1,
              max_args: 1) do |event, dice|
        trimmed_dice = dice.gsub(' ', '')
        # TODO: NdM: NとMに柔軟性をもたせる
        # TODO: friendlyなエラーメッセージを出す。N、Mの値で出し分ける
        unless trimmed_dice.match?(/\A[1-9]{1}d[1-9]{1,2}\z/i)
          return "こんなふうに使うんだぞ。\n`#{event.command.attributes[:usage]}`"
        end

        dices, sides = trimmed_dice.split(/d/i).map(&:to_i)
        results = (1..dices).map { rand 1..sides }
        format("#{'[%d]' * results.length}\n=> ***%d***", *results, results.sum)
      end
    end
  end
end

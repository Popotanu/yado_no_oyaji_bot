# frozen_string_literal: true

module YadoNoOyajiBot
  module Commands
    Dir["#{__dir__}/commands/*.rb"].sort.each { |f| require f }

    @commands = [Dice]

    def self.include_all!
      @commands.each { |mod| YadoNoOyajiBot::BOT.include!(mod) }
    end
  end
end

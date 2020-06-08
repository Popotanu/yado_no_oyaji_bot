module YadoNoOyajiBot
  module Commands
    Dir["#{__dir__}/bot/*.rb"].each { |f| require f }

    @commands = []
    
    def self.include_all!
      @commands.each { |command| YadoNoOyajiBot::BOT.include!(command) }
    end
  end
end

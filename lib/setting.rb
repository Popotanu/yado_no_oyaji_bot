# frozen_string_literal: true

module YadoNoOyajiBot
  class Settings
    YAML_PATH = "#{Dir.pwd}/config/settings.yml"
    def initialize
      @settings = YAML.load(ERB.new(File.read(YAML_PATH)).result)
      define_readers
    end

    private

    def define_readers
      @settings.keys.each do |key|
        next if defined? key
        define_method(key) do
          @settings[key]
        end
      end
    end
  end
end

# frozen_string_literal: true

module YadoNoOyajiBot
  class Settings
    YAML_PATH = "#{Dir.pwd}/config/settings.yml"
    def initialize
      @settings = YAML.safe_load(ERB.new(File.read(YAML_PATH)).result)
      define_readers
    end

    private

    def define_readers
      @settings.keys.each do |key|
        self.class.send(:define_method, key) { @settings[key] }
      end
    end
  end
end

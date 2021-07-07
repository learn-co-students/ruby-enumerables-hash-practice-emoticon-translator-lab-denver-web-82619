
require "pry"
emoticon_raw = {}

def load_library(file_path)
  organized_emojis = {:get_meaning => {},
                      :get_emoticon => {}}
  require "yaml"
  emoticon_raw = YAML.load_file(file_path)
  emoticon_raw.each_pair do |meaning, value|
    english = value[0]
    japan = value[1]
    value.each do |emoji|
      if emoji == japan
        organized_emojis[:get_meaning][japan] = meaning.to_s
      end
      if emoji == english
        organized_emojis[:get_emoticon][english] = japan.to_s
      end
    end
  end
  organized_emojis
end


def get_japanese_emoticon(file_path, emoticon)
  file_path
  emoji_list = load_library(file_path)
  emoji_list[:get_emoticon].fetch(emoticon, "Sorry, that emoticon was not found")

end

def get_english_meaning (file_path, emoticon)
  file_path
  emoji_list = load_library(file_path)
  p emoticon
  p emoji_list[:get_meaning].fetch(emoticon, "Sorry, that emoticon was not found")
end

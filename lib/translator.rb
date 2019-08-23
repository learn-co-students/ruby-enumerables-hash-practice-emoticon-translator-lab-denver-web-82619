require 'yaml'

def load_library(library)
  lib = {:get_emoticon => {}, :get_meaning => {}}
  YAML.load_file(library).keys.each do |emo|
    japamote = YAML.load_file(library)[emo][1]
    lib[:get_meaning][japamote] = emo
    engmote = YAML.load_file(library)[emo][0]
    lib[:get_emoticon][engmote] = japamote
  end
  return lib
end

def get_japanese_emoticon(library, emoticon)
  lib = load_library(library)
  if lib[:get_emoticon][emoticon]
    return lib[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(library, emoticon)
  lib = load_library(library)
  if lib[:get_meaning][emoticon]
    return lib[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

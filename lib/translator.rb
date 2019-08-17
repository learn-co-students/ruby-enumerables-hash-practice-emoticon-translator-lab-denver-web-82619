# require modules here

require "yaml"

def load_library (emoticon_file)
  library = YAML.load_file('./lib/emoticons.yml')
  new_library = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons| 
    english = emoticons[0]
    japanese = emoticons[1]
    new_library["get_meaning"][japanese] = meaning
    new_library["get_emoticon"][english] = japanese
  end
  new_library
end

def get_japanese_emoticon(emoticon_file, emoticons)
  new_library = load_library(emoticon_file)
  if new_library["get_emoticon"].include?(emoticons)
    new_library["get_emoticon"][emoticons]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(emoticon_file, emoticons)
  new_library = load_library(emoticon_file)
  if new_library["get_meaning"].include?(emoticons)
    new_library["get_meaning"][emoticons]
  else
    "Sorry, that emoticon was not found"
  end
end

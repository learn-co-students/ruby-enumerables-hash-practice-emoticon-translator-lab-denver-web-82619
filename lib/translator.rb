# require modules here
require "yaml"




def load_library(path)
  emotes = YAML.load_file(path)
  lib = {"get_emoticon" => {}, "get_meaning" => {}}
  emotes.each do |meaning, emote|
    eng, jp = emote
    lib["get_meaning"][jp] = meaning
    lib["get_emoticon"][eng] = jp
  end
  lib
end

def get_japanese_emoticon(path, emoticon)
  emotes = load_library(path)
  if emotes["get_emoticon"][emoticon]
    return emotes["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  emotes = load_library(path)
  if emotes["get_meaning"][emoticon]
    return emotes["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
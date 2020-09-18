require "yaml"
require "pry"

def load_library(path)
  emoticons = YAML.load_file(path)
  lookup = {}
  lookup[:get_meaning] = {}
  lookup[:get_emoticon] = {}
  
  emoticons.each do |word, pair|
    japanese = pair[1]
    american = pair[0]
    
    lookup[:get_meaning][japanese] = word
    lookup[:get_emoticon][american] = japanese
  end
  
  lookup
end

=begin This is the source data in emoticons.yml
  emoticons
=> {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 "bored"=>[":O", "(ΘεΘ;)"],
 "confused"=>["%)", "(゜.゜)"],
 "embarrased"=>[":$", "(#^.^#)"],
 "fish"=>["><>", ">゜))))彡"],
 "glasses"=>["8D", "(^0_0^)"],
 "grinning"=>["=D", "(￣ー￣)"],
 "happy"=>[":)", "(＾ｖ＾)"],
 "kiss"=>[":*", "(*^3^)/~☆"],
 "sad"=>[":'(", "(Ｔ▽Ｔ)"],
 "surprised"=>[":o", "o_O"],
 "wink"=>[";)", "(^_-)"]}
=end

def get_japanese_emoticon(path, emoticon)
  lookup = load_library(path)
  if lookup[:get_emoticon][emoticon]
    return lookup[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  lookup = load_library(path)
  if lookup[:get_meaning][emoticon]
    return lookup[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
require 'yaml'
require 'pry'

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')

  emoticon_lib = {'get_meaning'  => {},
                  'get_emoticon' => {} }

  emoticons.each do |meaning, value|
    english = value[0]
    japanese = value[1]
    emoticon_lib['get_meaning'][japanese] = meaning
    emoticon_lib['get_emoticon'][english] = japanese
  end
  emoticon_lib
end

def get_japanese_emoticon(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
 japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
 japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_file,emoticon)
  emoticon_lib = load_library(emoticon_file)
  english_meaning = emoticon_lib['get_meaning'][emoticon]
  english_meaning ? english_meaning : 'Sorry, that emoticon was not found'
end

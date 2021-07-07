# frozen_string_literal: true

require 'pry'
require 'yaml'

def load_library(file)
  library = YAML.load_file(file)
  result = {'get_meaning' => {}, 'get_emoticon' => {}}
  library.each do |meaning, emoticons|
    result['get_meaning'][emoticons[1]] = meaning
    result['get_emoticon'][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(file = './lib/emoticons.yml', english_emoticon)
  library = load_library(file)
  if library['get_emoticon'].include?(english_emoticon) 
    library['get_emoticon'][english_emoticon]
  else
    'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(file = './lib/emoticons.yml', japanese_emoticon)
  library = load_library(file)
  if library['get_meaning'].include?(japanese_emoticon) 
    library['get_meaning'][japanese_emoticon]
  else
    'Sorry, that emoticon was not found'
  end
end

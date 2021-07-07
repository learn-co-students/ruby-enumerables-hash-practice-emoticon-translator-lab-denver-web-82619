# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticon_lib = YAML.load_file(file_path)
  new_hash = {}
  emoticon_lib.each do |emotion, symbol_array|
    new_hash["get_meaning"] ||= {}
    new_hash["get_emoticon"] ||= {}
    new_hash["get_meaning"][symbol_array.last] ||= emotion
    new_hash["get_emoticon"][symbol_array.first] ||= symbol_array.last
  end 
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  library_hash = load_library(file_path)
  english = emoticon
  if library_hash["get_emoticon"][english] != nil 
    library_hash["get_emoticon"][english]
  else 
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path, emoticon)
  emo_hash = load_library(file_path)
  japanese = emoticon
    if emo_hash["get_meaning"][japanese] != nil 
      emo_hash["get_meaning"][japanese]
  else 
    "Sorry, that emoticon was not found"
  end
end  

require 'yaml'

def load_library(emoticon_file)
  emoji = YAML.load_file(emoticon_file)
  dictionary = {"get_meaning" => {}, "get_emoticon" => {}}
  emoji.each do |key, value|
    dictionary["get_meaning"][value[1]] = key
    dictionary["get_emoticon"][value[0]] = value[1]
end
dictionary
end

def get_japanese_emoticon(file, western)
  dictionary = load_library(file)
  if dictionary["get_emoticon"].keys.include?(western)
    dictionary["get_emoticon"][western]
  else
    return "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file, japanese)
  dictionary = load_library(file)
  if dictionary["get_meaning"].keys.include?(japanese)
    dictionary["get_meaning"][japanese]
  else
    return "Sorry, that emoticon was not found"
  end
end
require "yaml"

def load_library(file_path)
  original_library = YAML.load_file(file_path)
  emoticon_library = {}
  
  emoticon_library["get_meaning"] = original_library.reduce({}) do |memo, (key, value)|
      memo[value[1]] = key
      memo
    end

  emoticon_library["get_emoticon"] = original_library.reduce({}) do |memo, (key, value)|
    memo[value[0]] = value[1]
    memo
  end
  
  emoticon_library
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_library = load_library(file_path)
  
  emoticon = emoticon_library["get_emoticon"][emoticon]
  
  if (!emoticon)
    return "Sorry, that emoticon was not found"
  else
    return emoticon
  end
end

def get_english_meaning(file_path, emoticon)
  emoticon_library = load_library(file_path)
  
  meaning = emoticon_library["get_meaning"][emoticon]
  
  if (!meaning)
    return "Sorry, that emoticon was not found"
  else
    return meaning
  end
end




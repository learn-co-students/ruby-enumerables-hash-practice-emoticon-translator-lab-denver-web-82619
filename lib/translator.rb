require "yaml"
def load_library(emoticon_file)
  japanese_emoji = YAML.load(File.read("lib/emoticons.yml"))
    emojis = {'get_meaning'  => {},
                  'get_emoticon' => {} }
  japanese_emoji.each do |meaning, e|
    
    english = e[0]
    japanese = e[1]
    
    emojis['get_meaning'][japanese] = meaning
    emojis['get_emoticon'][english] = japanese
  end
  emojis
end


def get_japanese_emoticon(emoticon_file, emoticon)
  emoticons = load_library(emoticon_file)
  japanese_emoticons = emoticons['get_emoticon'][emoticon]
  japanese_emoticons ? japanese_emoticons: "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticon_file, emoticon)
  emoticons = load_library(emoticon_file)
  english_emoticon = emoticons['get_meaning'][emoticon]
  english_emoticon ? english_emoticon: "Sorry, that emoticon was not found" 
end




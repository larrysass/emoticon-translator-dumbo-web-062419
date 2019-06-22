# require modules here
require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  emoticon_hash["retrieve_emoticon"] = Hash.new
  emoticon_hash["retrieve_meaning"] = Hash.new

  emoticons.each do |english_word, emoticon_set|
    emoticon_hash["retrieve_emoticon"][emoticon_set.first] = emoticon_set.last
    emoticon_hash["retrieve_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end


def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["retreive_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["retrieve_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end
  result
end

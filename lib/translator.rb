# require modules here
require "yaml"


def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  new_emoticons = {}
  new_emoticons["get_meaning"] = {}
  new_emoticons["get_emoticon"] = {}
  
  emoticons.each do |key, value|
    new_emoticons["get_meaning"][value.last] = key
    new_emoticons["get_emoticon"][value.first] = value.last
  end
  new_emoticons
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  new_emoticons = load_library(path)
  ans = new_emoticons["get_emoticon"][emoticon]
  if !ans
    return "Sorry, that emoticon was not found"
  else
    return ans
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  new_emoticons = load_library(path)
  ans = new_emoticons["get_meaning"][emoticon]
  if !ans
    return "Sorry, that emoticon was not found"
  else
    return ans
  end
end
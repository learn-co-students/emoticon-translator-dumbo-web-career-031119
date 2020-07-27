# require modules here
require "yaml"
require "pry"

def load_library(fileD)
  # code goes here
  file = YAML.load_file(fileD)
  answer = Hash.new()
  answer["get_meaning"] = {}
  answer["get_emoticon"] = {}
  file.each do |keys,values|
    answer["get_meaning"][values[1]] = keys #:) => happy
    answer["get_emoticon"][values[0]] = values[1] # :) => :)
  end
  answer
end

def get_japanese_emoticon(fileD, emote)
  # code goes here
  libr = load_library(fileD)
  if libr["get_emoticon"][emote] != nil
    return libr["get_emoticon"][emote]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(fileD, emote)
  # code goes here
  libr = load_library(fileD)
  if libr["get_meaning"][emote] != nil
    return libr["get_meaning"][emote]
  else
    return "Sorry, that emoticon was not found"
  end
end
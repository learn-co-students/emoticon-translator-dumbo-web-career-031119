# require modules here
require 'yaml'
require 'pry'

def load_library(fileE)
  # code goes here
  emotes = YAML.load_file(fileE)
  nuhash = {}
  nuhash["get_meaning"] = {}
  nuhash["get_emoticon"] = {}

  emotes.each do |key, value|
    # binding.pry
    # assign the japanese emote the english meaning
    nuhash["get_meaning"][value.last] = key
    # assign the english emote to the japanese emote
    nuhash["get_emoticon"][value.first] = value.last
  end
  nuhash
end

def get_japanese_emoticon(file, emote)
  # code goes here
  # load the file
  emote_hash = load_library(file)
  # assign a variable to the get emote hash and the emote called
  answer = emote_hash["get_emoticon"][emote]

  # check if the emote exists
  if answer == nil
    # if it doesn't alert the user that it doesn't
    answer = "Sorry, that emoticon was not found"
  end
  # return the emote needed
  answer
end

def get_english_meaning(file, emote)
  # code goes here
  # load the file
  english_hash = load_library(file)
  # assign a variable the engish meaning hash and the emote called
  answer = english_hash["get_meaning"][emote]

  # check if the emote exists
  if answer == nil
    # if it doesn't alert the user that it doesn't
    answer = "Sorry, that emoticon was not found"
  end
  # return the meaning needed
  answer
end

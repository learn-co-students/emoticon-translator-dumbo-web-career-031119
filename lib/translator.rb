require"yaml"
require"pry"

def load_library(file_path)
  library = YAML.load_file(file_path)
  new_library = {}
  meaning = {}
  emoticon = {}
  library.each do |x,y|
    meaning[y[1]] = x
    emoticon[y[0]] = y[1]
  end
  new_library["get_meaning"] = meaning
  new_library["get_emoticon"] = emoticon
  new_library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  response = ""
  library.each do |x,y|
    if y.keys.include?(emoticon)
      response =  library[x][emoticon]
    else
      response = "Sorry, that emoticon was not found"
    end
  end
  response
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  response = ""
  library.each do |x,y|
    if x == "get_meaning"
      if y.keys.include?(emoticon)
        response = library["get_meaning"][emoticon]
      else
        response = "Sorry, that emoticon was not found"
      end
    end
  end
  response
end

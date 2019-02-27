# require modules here
require"yaml"
require"pry"
def load_library(file_path)
  library = YAML.load_file(file_path)
  new_library = {}
  meaning = {}
  emoticon = {}
    library.each do |k,v|
      meaning[v[1]] = k
      emoticon[v[0]] = v[1]
   end
   new_library["get_meaning"] = meaning
   new_library["get_emoticon"] = emoticon
   new_library
end

def get_japanese_emoticon(file_path,emoticon)
  library = load_library(file_path)
  answer = ""
  library.each do |k,v|


    if v.keys.include?(emoticon)

       answer = library[k][emoticon]

    else
       answer = "Sorry, that emoticon was not found"
    end

  end
  answer
end





def get_english_meaning(file_path,emoticon)
  library = load_library(file_path)
  answer = ""
  library.each do |k,v|
     if k == "get_meaning"
        if v.keys.include?(emoticon)
          answer = library["get_meaning"][emoticon]
        else
          answer = "Sorry, that emoticon was not found"
        end
      end
    end
    answer
end

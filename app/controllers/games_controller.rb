require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    (0...10).each do
      @letters << ("A".."Z").to_a.sample
    end
  end

  def score
  @reply = params[:word]
  @letters = params[:grid]
  url = "https://wagon-dictionary.herokuapp.com/#{@reply}"
  user_serialized = open(url).read
  api_dict_response = JSON.parse(user_serialized)
  @english_word = api_dict_response["found"]
  if @reply.gsub(/\W/, "").chars.length > @letters.gsub(/\W/, "").chars.length
    @nb_in_the_grid = false
  else @nb_in_the_grid = true
    grid_compo = {}
    attempt_compo = {}
    result = {}
    attempt2 = attempt.split
    result["time"] = (end_time - start_time).to_i
    result["score"] = result[time] + attempt.length
    attempt2.map do |letter|
      attempt_compo.key?(letter) ? attempt_compo[letter] += 1 : attempt_compo[letter] = 1
    end
    grid2.map do |letter|
      grid_compo.key?(letter) ? grid_compo[letter] += 1 : grid_compo[letter] = 1
    end
  end

#   attempt_compo = {}
#   grid_compo = {}
#   result = {}
#   attempt2 = params[:word].split
#   grid2 = params[:grid].chars
#   # result["time"] = (end_time - start_time).to_i
#   # result["score"] = result[time] + attempt.length
#   attempt2.map do |letter|
#     attempt_compo.key?(letter) ? attempt_compo[letter] += 1 : attempt_compo[letter] = 1
#   end
#   grid2.map do |letter|
#     grid_compo.key?(letter) ? grid_compo[letter] += 1 : grid_compo[letter] = 1
#   end
#  attempt_compo <= grid_compo
#   #   return "your score = #{}"
#   # else
#   #   return "you're a looser"
#   # end
  end
  #   def english_word?

  #   url = "https://wagon-dictionary.herokuapp.com/#{word}"
  #   user_serialized = open(url).read
  #   api_dict_response = JSON.parse(user_serialized)

  #   return api_dict_response["found"]
  # end

end



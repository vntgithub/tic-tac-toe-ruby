# frozen_string_literal: true

#
# Class to store player data
class Player
  attr_accessor :name
  attr_reader :char, :color

  def initialize(name, char, color)
    @name = name
    @char = char
    @color = color
  end
end

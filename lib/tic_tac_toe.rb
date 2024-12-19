# frozen_string_literal: true

require 'colorize'
require_relative 'player'
require_relative 'board'

# Class for a game tic tac toe game
class TicTacToe
  def initialize
    @player_x = Player.new('', 'X', :blue)
    @player_o = Player.new('', 'O', :yellow)
    @board = Board.new
    @turn = 0
  end

  def input_player_names
    puts "Player's name 1 (X): "
    @player_x.name = gets.chomp

    puts "Player's name 2 (O): "
    @player_o.name = gets.chomp
  end

  def load_player_by_turn
    if @turn.zero?
      @player_x
    else
      @player_o
    end
  end

  def input_and_mark_to_the_board
    input = gets.chomp.split
    row, col = input
    print_endline_for_user
    @board.mark(row.to_i, col.to_i, load_player_by_turn.char)
  end

  def load_the_winner_by_char
    char = @board.find_the_winner
    return @player_x if char == 'X'

    @player_o
  end

  def end_game_message
    puts '---------'.colorize(:green)
    puts 'Game over'.colorize(:green)
    puts '---------'.colorize(:green)
  end

  def congratulation_message(the_winner)
    puts '----------------------------------'.colorize(the_winner.color)
    puts "#{the_winner.name} (#{the_winner.char}) is the winner!".colorize(the_winner.color)
    puts '----------------------------------'.colorize(the_winner.color)
  end

  def end_game
    the_winner = load_the_winner_by_char

    puts 'Drawn!!!' unless the_winner
    congratulation_message(the_winner) if the_winner
  end

  def raise_invalid_position
    puts '------------------------------------------'.colorize(:red)
    puts 'Invalid position! Row and Col must in 0..2'.colorize(:red)
    puts '------------------------------------------'.colorize(:red)
  end

  def print_player_turn_message
    print_endline_for_user
    puts "#{load_player_by_turn.name}'s turn, choose position (eg: 0 0): ".colorize(load_player_by_turn.color)
    print_endline_for_user
  end

  def print_endline_for_user
    puts '----------------------------------'.colorize(load_player_by_turn.color)
  end

  def starting_message
    puts '--------------'.colorize(:green)
    puts 'Game starting'.colorize(:green)
    puts '--------------'.colorize(:green)
  end

  def update_turn
    @turn = (@turn + 1) % 2
  end

  def start_game
    until @board.find_the_winner || @board.all_cell_marked?
      @board.render_board
      print_player_turn_message
      mark_result = input_and_mark_to_the_board
      update_turn if mark_result == :ok
      raise_invalid_position if mark_result == :error
    end
  end

  def run
    input_player_names
    starting_message
    start_game
    end_game_message
    end_game
  end
end

# frozen_string_literal: true

# Class to store game data
class Board
  attr_accessor :is_end_game, :the_winner
  attr_reader :board

  VALID_POSITION = { 0 => true, 1 => true, 2 => true }.freeze
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @is_end_game = false
    @the_winner = nil
  end

  def rows_check
    @board.each do |row|
      row = row.reject { |cell| cell == ' ' }
      size = row.size
      uniq_size = row.uniq.size
      return row[0] if size == 3 && uniq_size == 1
    end
    nil
  end

  def cols_check
    (0..2).each do |index|
      cells_of_column = [@board[0][index], @board[1][index], @board[2][index]].reject { |cell| cell == ' ' }
      size = cells_of_column.size
      uniq_size = cells_of_column.uniq.size
      return cells_of_column[0] if size == 3 && uniq_size == 1
    end
    nil
  end

  def diagonals_check
    diagonal_cells = diagonal_coords
    return @board[1][1] if diagonal_cells.size == 3 && diagonal_cells.uniq.size == 1

    anti_diagonal_cells = anti_diagonal_coords
    return @board[1][1] if anti_diagonal_cells.size == 3 && anti_diagonal_cells.uniq.size == 1

    nil
  end

  def diagonal_coords
    [@board[0][0], @board[1][1], @board[2][2]].reject { |cell| cell == ' ' }
  end

  def anti_diagonal_coords
    [@board[0][2], @board[1][1], @board[2][0]].reject { |cell| cell == ' ' }
  end

  def find_the_winner
    the_winner = rows_check || cols_check || diagonals_check
    return the_winner if the_winner != ' '

    nil
  end

  def update_the_winner
    the_winner = find_the_winner
    return unless the_winner

    @is_end_game = true
    @the_winner = the_winner
  end

  def mark(row, col, char)
    if VALID_POSITION.key?(col) && VALID_POSITION.key?(row) && @board[row][col] == ' '
      @board[row][col] = char
      update_the_winner
      return :ok
    end
    :error
  end

  def render_board
    @board.each_with_index do |row, index|
      puts row.join(' | ')
      puts '---------' unless index == @board.size - 1
    end
  end
end
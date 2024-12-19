# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/board'

RSpec.describe 'Test board class' do # rubocop:disable Metrics/BlockLength
  describe 'Test mark method' do
    board = Board.new
    it 'Mark valid position' do
      expect(board.mark(0, 0, 'X')).to eq(:ok)
    end

    it 'Mark invalid position 1' do
      expect(board.mark(3, 0, 'O')).to eq(:error)
    end

    it 'Mark invalid position 2' do
      board.mark(2, 0, 'O')
      expect(board.mark(2, 0, 'O')).to eq(:error)
    end
  end
  describe 'Test cols check method. Not found case' do
    it 'Not have any column was marked same characters' do
      board = Board.new
      expect(board.cols_check).to eq(nil)
    end
    it 'Not have any column was marked same characters 2' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(1, 0, 'O')
      board.mark(2, 0, 'X')

      expect(board.cols_check).to eq(nil)
    end
  end

  describe 'Test cols check method. Found case' do
    it 'All cells of column 0 is X' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(1, 0, 'X')
      board.mark(2, 0, 'X')

      expect(board.cols_check).to eq('X')
    end
    it 'All cells of column 1 is O' do
      board = Board.new
      board.mark(0, 1, 'O')
      board.mark(1, 1, 'O')
      board.mark(2, 1, 'O')

      expect(board.cols_check).to eq('O')
    end
    it 'All cells of column 2 is O' do
      board = Board.new
      board.mark(0, 1, 'O')
      board.mark(1, 1, 'O')
      board.mark(2, 1, 'O')

      expect(board.cols_check).to eq('O')
    end
  end

  describe 'Test rows check method. Not found case' do
    it 'Not have any row was marked same characters' do
      board = Board.new
      expect(board.rows_check).to eq(nil)
    end
    it 'Not have any row was marked same characters 2' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(0, 1, 'O')
      board.mark(0, 2, 'X')

      expect(board.rows_check).to eq(nil)
    end
  end

  describe 'Test cols check method. Found case' do
    it 'All cells of row 0 is X' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(0, 1, 'X')
      board.mark(0, 2, 'X')

      expect(board.rows_check).to eq('X')
    end
    it 'All cells of row 1 is O' do
      board = Board.new
      board.mark(1, 0, 'O')
      board.mark(1, 1, 'O')
      board.mark(1, 2, 'O')

      expect(board.rows_check).to eq('O')
    end
    it 'All cells of row 2 is O' do
      board = Board.new
      board.mark(2, 0, 'O')
      board.mark(2, 1, 'O')
      board.mark(2, 2, 'O')

      expect(board.rows_check).to eq('O')
    end
  end

  describe 'Test diagonals_check  method. Not found case' do
    it 'Not have any cell was marked same characters' do
      board = Board.new
      expect(board.diagonals_check).to eq(nil)
    end
    it 'Not have any row was marked same characters 2' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(1, 1, 'O')
      board.mark(2, 2, 'X')

      expect(board.diagonals_check).to eq(nil)
    end
  end

  describe 'Test diagonals_check method. Found case' do
    it 'All cells of row diagonals is O' do
      board = Board.new
      board.mark(0, 0, 'O')
      board.mark(1, 1, 'O')
      board.mark(2, 2, 'O')

      expect(board.diagonals_check).to eq('O')
    end
    it 'All cells of antidiagonals is O' do
      board = Board.new
      board.mark(0, 2, 'O')
      board.mark(1, 1, 'O')
      board.mark(2, 0, 'O')

      expect(board.diagonals_check).to eq('O')
    end
  end

  describe 'Test find the winner' do
    it 'The winner not found' do
      board = Board.new
      expect(board.find_the_winner).to eq(nil)
    end
    it 'The winner not found 2' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(0, 1, 'O')
      board.mark(0, 2, 'X')

      expect(board.find_the_winner).to eq(nil)
    end
  end

  describe 'Test find the winner. Found case' do
    it 'The winner test case all cells of row 1 is X' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(0, 1, 'X')
      board.mark(0, 2, 'X')
    end
    it 'The winner test case all cells of row 2 is X' do
      board = Board.new
      board.mark(1, 0, 'O')
      board.mark(1, 1, 'O')
      board.mark(1, 2, 'O')

      expect(board.find_the_winner).to eq('O')
    end
  end

  describe 'Test render board' do
    let(:expected_output) do
      <<~OUTPUT.chomp
        X | O | X
        ---------
        O | X | O
        ---------
        X |   | O
      OUTPUT
    end
    it 'renders the board correctly' do
      board = Board.new
      board.mark(0, 0, 'X')
      board.mark(0, 1, 'O')
      board.mark(0, 2, 'X')
      board.mark(1, 0, 'O')
      board.mark(1, 1, 'X')
      board.mark(1, 2, 'O')
      board.mark(2, 0, 'X')
      board.mark(2, 2, 'O')
      output = StringIO.new
      $stdout = output  # Redirect $stdout
      board.render_board
      $stdout = STDOUT  # Restore $stdout
      expect(output.string.chomp).to eq(expected_output)
    end
  end
end

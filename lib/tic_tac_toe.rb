class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    "#{input}".to_i - 1
  end

  def move(index,current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count do |i|
      i == "X" || i == "O"
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

    def won?
      WIN_COMBINATIONS.detect do |i|
        position_taken?(i[0]) && @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]]
      end
    end

    def full?
      @board.all? do |i|
        i == "X" || i == "O"
      end
    end

    def draw?
      full? && !won?
    end

    def over?
      full? || won?
    end

    def winner
      @board[won?[0]] if won?
    end

    def play
      turn until over? || won? || draw?
      puts "Congratulations #{winner}!" if won?
      puts "Cat's Game!" if draw?
    end
  end

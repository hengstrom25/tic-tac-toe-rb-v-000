board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS =
  [ 
    [0,1,2], 
    [3,4,5],
    [6,7,8], 
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
 def won?(board)
  WIN_COMBINATIONS.each do |line|
    if (board[line[0]]) == "X" && (board[line[1]]) == "X" && (board[line[2]]) == "X"
      return line
    elsif (board[line[0]]) == "O" && (board[line[1]]) == "O" && (board[line[2]]) == "O"
      return line
    end
  end
  false
end

def full?(board)
  board.all? {|input| input == "X" || input == "O"}
end
  
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)
  
def input_to_index(user_input)
  converted_input = user_input.to_i-1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || board[index] == "" || board[index] == "nil"
    false
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && (index).between?(0, 8) == true
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, value = "X")
    display_board(board)
  else 
    turn(board)
  end
end

  def turn_count(board)
  counter = 0
  board.each do |turn|
  if turn == "X" || turn == "O"
  counter += 1
  puts "#{counter}"
  end
end

counter
end

def current_player(board)
  if turn_count(board).even?
  return "X"
  else
  return "O"
  end
end

 current_player(board) 
 
 def play(board)
  counter = 0
    until counter >= 9
    puts turn(board)
    counter += 1
    end
  end
 

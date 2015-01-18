####################
#Tic Tac Toe
#Tim Williams 1/17/2015
#####################

#Initialize variables
puts "Play Tic Tac Toe"
win_conditions = [[1,1,1,0,0,0,0,0,0],[0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,1,1,1],[1,0,0,1,0,0,1,0,0],
                  [0,1,0,0,1,0,0,1,0],[0,0,1,0,0,1,0,0,1],[1,0,0,0,1,0,0,0,1],[0,0,1,0,1,0,1,0,0]] 

block_conditions = [[0,0,0,1,0,0,1,0,0],[0,1,1,0,0,0,0,0,0],[0,0,0,0,1,0,0,0,1],[0,0,0,0,1,0,0,1,0],
                    [0,0,0,0,0,1,0,0,1],[0,0,0,0,1,0,1,0,0],[1,1,0,0,0,0,0,0,0],[0,0,0,0,1,1,0,0,0],
                    [0,0,0,1,1,0,0,0,0],[1,0,0,1,0,0,0,0,0],[0,0,1,0,1,0,0,0,0],[0,0,0,0,0,0,0,1,1],
                    [0,1,0,0,1,0,0,0,0],[0,0,1,0,0,1,0,0,0],[0,0,0,0,0,0,1,1,0],[1,0,0,0,1,0,0,0,0]]

#Method that multiplies individual array elements 
def multiply_array_elements(array1,array2)
  result_array = []
  for index in 0..8
    begin
    result_array[index] = array1[index]*array2[index]
    rescue 
    #puts 'FAIL!'
    end
  end 
  return result_array
end

#Main loop
begin

 #initialize
  game_board_array = [1,2,3,4,5,6,7,8,9]
  user_input = ""
  computer_input = 0
  free_space = 9
  check_x_array = []
  check_o_array = []
  response = "Y"
  game_over = false
  game_board = "     |     |     
              \n  1  |  2  |  3      
              \n     |     |      
              \n-----+-----+-----
              \n     |     |      
              \n  4  |  5  |  6
              \n     |     |      
              \n-----+-----+-----
              \n     |     |     
              \n  7  |  8  |  9
              \n     |     |     "

  puts game_board
  
  #validate user input
  begin
    loop do
      puts "\nChoose an open position to place an x piece:"
      user_input = gets.chomp
      if (user_input == "1"||user_input == "2"||user_input == "3"||user_input == "4"||
          user_input == "5"||user_input == "6"||user_input == "7"||user_input == "8"||user_input =="9") 
        if (game_board_array[user_input.to_i-1] != "x") && (game_board_array[user_input.to_i-1] != "o")
          break
        end 
      else
        puts "Invalid input. Try again"
      end 
    end 

  #Place user input
  game_board_array[user_input.to_i-1] = "x"
  free_space = free_space - 1
  game_board =   "     |     |     
                \n  #{game_board_array[0]}  |  #{game_board_array[1]}  |  #{game_board_array[2]}
                \n     |     |      
                \n-----+-----+-----
                \n     |     |      
                \n  #{game_board_array[3]}  |  #{game_board_array[4]}  |  #{game_board_array[5]}
                \n     |     |      
                \n-----+-----+-----
                \n     |     |     
                \n  #{game_board_array[6]}  |  #{game_board_array[7]}  |  #{game_board_array[8]}
                \n     |     |     "

  puts game_board

  #Convert x's in array to 1's 
  x_array = game_board_array.map do |index|
    if index == "x"
      index = 1
    else
      index = 0
    end
  end

  #Check if x won:
  for index in 0..8
    check_x_array = multiply_array_elements(x_array,win_conditions[index])
      if check_x_array == win_conditions[index]
        puts "x wins!"
        game_over = true
      end
  end 

  #Should the computer block x?
  def block_x?(x_array,block_array)
    block_index = 9 #outside scope of array
    result_array = []
    for index in 0..15
      result_array = multiply_array_elements(x_array,block_array[index])
        if result_array == block_array[index]
          if index >= 0 && index <= 2
            block_index = 0 
          elsif index == 3
            block_index = 1
          elsif index >= 4 && index <= 6
            block_index = 2
          elsif index == 7
            block_index = 3
          elsif index == 8
            block_index = 5
          elsif index >= 9 && index <= 11
            block_index = 6
          elsif index == 12
            block_index = 7
          elsif index >= 13 && index <= 15
            block_index = 8
        end
     end 
   end 
    return block_index 
  end #=> block location. 9 means just place anywhere

  #Get computer input
  loop do 
    computer_input = rand(9)  #geta random number between from 0 to 8
    block_index = block_x?(x_array,block_conditions) 

    if free_space == 0 || game_over == true #if the board is full, game over
      break
    elsif block_index != 9 && game_board_array[block_index] != "o" #should the computer block?
      game_board_array[block_index] = "o"
      free_space = free_space - 1
      break
    #place o in a random open spot
    elsif (game_board_array[computer_input] != "x") && (game_board_array[computer_input] != "o")
      game_board_array[computer_input] = "o"
      free_space = free_space - 1
      break
    end 
  end 

  #Place user input
  game_board =   "     |     |     
                \n  #{game_board_array[0]}  |  #{game_board_array[1]}  |  #{game_board_array[2]}
                \n     |     |      
                \n-----+-----+-----
                \n     |     |      
                \n  #{game_board_array[3]}  |  #{game_board_array[4]}  |  #{game_board_array[5]}
                \n     |     |      
                \n-----+-----+-----
                \n     |     |     
                \n  #{game_board_array[6]}  |  #{game_board_array[7]}  |  #{game_board_array[8]}
                \n     |     |     "

  #Don't print game board if game is over
  if game_over == false
    puts game_board
  end

  #Convert o's in array to 1's 
  o_array = game_board_array.map do |index|
    if index == "o"
      index = 1
    else
      index = 0
    end
  end

  #Check if o won:
  for index in 0..8
    check_o_array = multiply_array_elements(o_array,win_conditions[index])
      if check_o_array == win_conditions[index]
        puts "o wins!"
        game_over = true
      end
  end 

  #Check for tie:
  if free_space == 0 && game_over != true
    puts "tie!"
    game_over = true 
  end 

  end while game_over == false

  puts "If you want to play again type 'Y'" 
  response = gets.chomp

end while response.upcase == 'Y'


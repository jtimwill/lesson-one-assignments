####################
#Tic Tac Toe
#Tim Williams 1/17/2015
#####################

#Initialize variables
puts "Play Tic Tac Toe"
win_conditions = [[1,1,1,0,0,0,0,0,0],[0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,1,1,1],[1,0,0,1,0,0,1,0,0],
                  [0,1,0,0,1,0,0,1,0],[0,0,1,0,0,1,0,0,1],[1,0,0,0,1,0,0,0,1],[0,0,1,0,1,0,1,0,0]]

#Method that multiplies individual array elements 
def multiply_array_elements(array1,array2)
  result_array = []
  for i in 0..8
    begin
    result_array[i] = array1[i]*array2[i]
    rescue 
    #puts 'FAIL!'
    end
  end 
  return result_array
end

#Main loop
begin

 #validate user input
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

  begin
    loop do
      puts "\nChoose an open position to place an x piece:"
      user_input = gets.chomp
      if (user_input == "1"||user_input == "2"||user_input == "3"||user_input == "4"||user_input == "5"||user_input == "6"||user_input == "7"||user_input == "8"||user_input =="9") 
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
  x_array = game_board_array.map do |i|
    if i == "x"
      i = 1
    else
      i = 0
    end
  end

  #Check if x won:
  for i in 0..8
    check_x_array = multiply_array_elements(x_array,win_conditions[i])
      if check_x_array == win_conditions[i]
        puts "x wins!"
        game_over = true
        break
      end
  end 

  #Get computer input
  loop do 
    computer_input = rand(9)  #geta random number between from 0 to 8
    if free_space == 0
      break
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
  o_array = game_board_array.map do |i|
    if i == "o"
      i = 1
    else
      i = 0
    end
  end

  #Check if o won:
  for i in 0..8
    check_o_array = multiply_array_elements(o_array,win_conditions[i])
      if check_o_array == win_conditions[i]
        puts "o wins!"
        game_over = true
        break
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


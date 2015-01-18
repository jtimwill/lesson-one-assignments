####################
#Rock Paper Scissors
#Tim Williams 1/15/2015
#####################

puts "Play Rock Paper Scissors!"

#Initialize variables
#                  W          L       T
rock_array     = ["scissors","paper","rock"]
paper_array    = ["rock","scissors","paper"] 
scissors_array = ["paper","rock","scissors"] 
rock_paper_scissors_array = [rock_array,paper_array,scissors_array]

user_input_array = []
computer_input_string = ""

#Main loop
begin

  user_input = ""
   #Get and validate user input
    loop do 
    puts "Choose one: (R/P/S)"

    user_input = gets.chomp

    #Make sure the user enters a valid number
    if  user_input.upcase == "R" 
      user_input_array = rock_paper_scissors_array[0]
      break
    elsif user_input.upcase == "P"
       user_input_array = rock_paper_scissors_array[1]
      break
    elsif user_input.upcase == "S"
       user_input_array = rock_paper_scissors_array[2]
      break  
    else 
      puts "You did not enter a vaid character. Try again"
    end
  end 
  
  #The computer input will be an int from 0 to 2
  computer_input = rand(3) 
   
  #convert the number to (R/P/S)
  computer_input_string = rock_array[computer_input]

  #Who won?
  if computer_input_string == user_input_array[0]
    puts "You picked #{user_input_array[2]}. The computer picked #{computer_input_string}. You won!"
  elsif computer_input_string == user_input_array[1]
    puts "You picked #{user_input_array[2]}. The computer picked #{computer_input_string}. You lose!"
  elsif computer_input_string == user_input_array[2]
    puts "You picked #{user_input_array[2]}. The computer picked #{computer_input_string}. You tied"
  end 

  puts "If you want to try again type 'Y'" 

  response = gets.chomp 

end while response.upcase == 'Y'

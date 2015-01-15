#Calculator Assignment
#Tim Williams 1/14/2015


begin 

  selected_op = ""
  first_number = ""
  second_number = ""

  #Get the numbers
  loop do 
    puts "What is your first number?"

    first_number = gets.chomp

    #Make sure the user enters a valid number
    if  first_number != "0" && first_number.to_i == 0

        puts "You did not enter a number. Try again"

    else 
  
      break

    end

  end 
  

  loop do 
    puts "What is your second number"

    second_number = gets.chomp

    #Make sure the user enters a valid number
    if  second_number != "0" && second_number.to_i == 0

        puts "You did not enter a number. Try again"

    else 
  
      break

    end

  end 

  

  
  loop do  

    puts "Select an operation:"

    puts "1: addition"
    puts "2: subtraction"
    puts "3: multiplication"
    puts "4: division"


    selected_op = gets.chomp

    #Make sure that the user selects a valid operation
    if selected_op == "1" || selected_op == "2" || selected_op == "3" || selected_op == "4"
    
      break

    else 
    puts "You selected an invalid operation. Try again"

    end

  end


  op_hash = {"1" => "+" , "2" => "-", "3" => "*", "4" => "/"}


  result = case selected_op #Perform selected operation

    when "1"

      result = first_number.to_i + second_number.to_i

    when "2"

      result = first_number.to_i - second_number.to_i

    when "3"

      result = first_number.to_i * second_number.to_i

    when "4"

      result = first_number.to_f / second_number.to_f

    else

      puts "The program should never get here"

    end 

  #Output results 
  puts "#{first_number} #{op_hash[selected_op]} #{second_number} = #{result}"
  
  
  puts "If you want to try again type 'Y'" 

  response = gets.chomp 

end while response == 'Y'

class Mastermind

    def initialize
        @computer = 1
        @human = 2
    end

    def random_number
        puts "Enter 1 to be code-braker or 2 to be code-maker"
        player = gets.to_i
        
        if player == 1
            rand(1000..9999)
        elsif player == 2
            puts "Create code! enter 4 random numbers"
            gets.chomp.to_i
        else
            puts "You entered a wrong choice!"
            random_number
        end

    end

    def player_guess
        puts "Guess the four digit number: "
        gets.chomp.to_i
    end

    def compare_random_number_and_players_guess(random_number, player_guess)
        number_of_guess = 0

        loop do
            #increments nuber of guesses each time player makes a guess
            number_of_guess+= 1

            if random_number == player_guess
                puts "You have become a mastermind!"
                puts "It took you only #{number_of_guess} tries!"
                break
            else
                #counts  correct digits
                correct_digits = 0

                #strores correct digits
                correct = Array.new(4) {[]}

                random_number_digits = random_number.digits.reverse
                player_guess_digits = player_guess.digits.reverse


                #compare each index
                random_number_digits.each_with_index do |digit, i|
                    if digit == player_guess_digits[i]
                        #number of digits guessed correctly increments
                        correct_digits += 1
                        #stores correct digit
                        correct[i] << digit
                    end
                end

                if correct_digits == 4
                    puts "You have become a mastermind!"
                    puts "It took you only #{number_of_guess} tries!"
                elsif correct_digits == 0
                    p correct
                    puts "None of the numbers in your input match!"
                    puts "Guess the four-digit number:"
                else
                    p correct
                    puts "Not quite the number, but you did get #{correct_digits} digit(s) correct!"
                    puts "Guess the four-digit number:"
                end

                player_guess = gets.chomp.to_i
            end
        end

    end

    #main game loop
    def play
        #game instructions
        puts "Welcome to Mastermind!\nEach player (Computer & Human) will paly one round"
        puts "12 points are awarded to the Code breaker when he/she cracks the code in the first atempt!"
        puts "1 point is awarded to the code maker when code breaker fails to crack the code"
        puts "Player with the most points wins the game!"
        puts "--------------------------------------------------------"

        random_number = random_number()
        player_guess = player_guess()
  
        compare_random_number_and_players_guess(random_number, player_guess)

    end

end

game1 = Mastermind.new
game1.play
class Mastermind

    def initialize
        #creates an array of all possible combinations of 4 digit
        #numbers consisting of (1-9)
        @all_possible_combinations = (1111..9999).to_a.select {|num| num.digits.reverse.all? {|digit| (1..9).include?(digit)}}
    end

    #random number generator
    def random_number
        puts "Enter 1 to be code-braker or 2 to be code-maker"
        @player = gets.to_i
        
        if @player == 1
            4.times.map {rand(1..9)}.join.to_i
        elsif @player == 2
            puts "Create code! enter 4 random numbers (1-9)"
            gets.chomp.to_i
        else
            puts "You entered a wrong choice!"
            random_number
        end

    end

    def human_guess
        puts "Guess the four digit number: "
        gets.chomp.to_i
    end

    def computer_guess
        puts "computer's guess: "
        @all_possible_combinations.sample
    end

    def players_guess
        if @player == 2
            computer_guess()
        elsif @player == 1
            human_guess()
        end
    end

    def compare_random_number_and_players_guess(random_number, players_guess)
        number_of_guess = 0

        loop do
            #increments nuber of guesses each time player makes a guess
            number_of_guess+= 1

            if random_number == players_guess
                puts "You have become a mastermind!"
                puts "It took you only #{number_of_guess} tries!"
                break
            else
                #counts  correct digits
                correct_digits = 0

                #strores correct digits
                correct = Array.new(4) {[]}

                random_number_digits = random_number.digits.reverse
                players_guess_digits = players_guess.digits.reverse


                #compare each index
                random_number_digits.each_with_index do |digit, i|
                    if digit == players_guess_digits[i]
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
                else
                    p correct
                    puts "Not quite the number, but you did get #{correct_digits} digit(s) correct!"
                end

                players_guess = players_guess()
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
        human_guess = players_guess()
  
        compare_random_number_and_players_guess(random_number, human_guess)

    end

end

game1 = Mastermind.new
game1.play
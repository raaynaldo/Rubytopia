class QuizMaster
    #random event that could happen
    #increases happiness if answer is correct
    #random generator for a question 
    #if happiness gets to 0, game ends???
    #CLI class will check the gets.strip and match answers
    def greeting 
        "Hello, I am Luke the Quiz Master. \n
        My only desire in life is to mess with people's lives \n
        by appearing before them and asking them questions \n
        to test their intelligence. \n
        Today is your lucky day! \n"
    end 

    def question_one 
        "What is the square root of 225?"
    end 

    def one_answer
        "15"
    end 

    def question_two
        "What year did World World II end?"
    end 

    def two_answer
        "1945"
    end 

    def question_three
        "Who is the 46th president of the United States?"
    end 

    def three_answer
        "biden"
    end 

    def question_four
        "What is 11 times 11?"
    end 

    def four_answer
        "121"
    end 

    def question_five 
        "Who is the main protagonist of the Pokemon series?"
    end 

    def five_answer
        "ash"
    end 

    def question_six
        "What do you call a baby cow?"
    end

    def six_answer
        "calf"
    end 
    
    def question_seven
        "What is one of the primary colors?"
    end 

    def seven_answer
        "blue, yellow, red"
    end 

    def question_eight
        "Who is the baby with the football-shaped head in Family Guy?"
    end 

    def eight_answer
        "stewie"
    end 

    def question_nine 
        "What is 12 times 12?"
    end 

    def nine_answer
        "144"
    end 

    def question_generator 
        a = rand(9)
        if a == 0
            question_one
        elsif a == 1
            question_two
        elsif a == 2
            question_three 
        elsif a == 3
            question_four
        elsif a == 4
            question_five
        elsif a == 5
            question_six
        elsif a == 6
            question_seven 
        elsif a == 7
            question_eight 
        elsif a == 8
            question_nine 
        end 
    end 
end 

puts QuizMaster.new.question_generator
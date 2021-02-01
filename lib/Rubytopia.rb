#add current monster to friend list if monster does not die
#if you cannot kill mosnter within 10 turns, the monster thinks you're super nice
#the monster tells you his/her name if they become your friend!
#add current mosnter to slain list if monster dies
#battle cry happens immediately when player chooses to enter into battle



class RubytopiaGame #this is the only clss that should have puts, and method invocation 
    
    attr_accessor :player_name, :monster, :background, :player  
    #monster should record his own health
   #if friends_made.count == 5, your journey comes to an end and your friends bid you farewell
    

    def start
        Scraper.new.make_mythplace
        self.greeting_user
        self.selecting_race
        sleep(5)
        self.setting_the_background 
        # sleep(5)
        # self.user_choosing_background
        #method for scraping favorited site (method will scrape a brief description of the place)
        # self.monter_generator
    end 

    def greeting_user
        puts "\n\n
        Hello, player! \n\n
        What is your name?"
        self.player_name = gets.strip 
        puts "\nWelcome #{self.player_name}! \n\n"
    end 
    
    def selecting_race
        puts "Please select a race to continue. \n\n
        1. Elf \n
        2. Human \n
        3. Giant"
        race_choice = gets.strip
        if race_choice.include?("1") || race_choice == "giant" || race_choice == "Giant"
            self.create_giant
        elsif race_choice.include?("2") || race_choice == "elf" || race_choice == "Elf"
            self.create_elf
        elsif race_choice.include?("3") || race_choice == "human" || race_choice == "Human"
            self.create_human
        else
            puts "It's not hard to select a race.\n
            Please try again.\n"
            selecting_race 
        end 
    end 

    def create_giant 
        self.player = Giant.new(self.player_name)
        puts "      💎 Welcome to Rubytopia, #{self.player_name}! 💎\n
        You've chosen to be part of the Giant Race. \n
        As a Giant, you have incredible stamina, \n
        but you have no idea what mana is or how to channel it. \n
        However, that does not stop you from being a happy Giant. \n

        HP: #{player.health} \n
        MP: #{player.mana} \n"
    end 
    
    def create_elf 
        self.player = Elf.new(self.player_name)
        puts "      💎 Welcome to Rubytopia, #{self.player_name}!💎 \n
        You've chosen to be part of the Elf Race. \n
        As an Elf, your ❤  is purest amongst other races, \n 
        so you are able to channel your mana more efficiently. \n
       
        HP: #{player.health} \n
        MP: #{player.mana} \n"
    end 

    def create_human 
        self.player = Human.new(self.player_name)
        puts "#{self.player_name}, seriously? \n
        Why would you want to be a Human \n
        when you are already one in real life? \n
        But I digress. \n\n
        💎 Welcome to Rubytopia, #{self.player_name}! 💎\n
        You've chosen to be part of the Human Race. \n
        As a Human, you have average stats amongst other races. \n
        
        HP: #{player.health} \n
        MP: #{player.mana} \n" 
    end 

    def setting_the_background
        puts "\n\nRubytopia is a land that is know for its mysterious portal. \n
        This portal can take you to any mythological land that you so desire. \n
        Today, it's your turn to play with this mysterious portal! \n
        Which mytholgical land would you like to visit? \n
        The most popular choices for Rubytopian citizens have been: \n
        Themyscira \n
        Avalon \n
        Atlantis \n
        Hell \n
        Asgard \n
        But feel free to take the road less traveled \n
        and go somewhere less popular. \n\n"
        choice = gets 
        if MythPlace.all.find {|place| place.name == choice} #truthy statement #why is this not registering
            self.background = MythPlace.all.find {|place| place.name == choice}
            puts "Splendid choice! You've chosen to explore #{self.background.name}. \n
            Did you know that #{self.background.name} is #{self.background.description} \n
            Well, now you do."
        else 
            puts "\nPlease remember how to spell proper nouns.\n"
            self.setting_the_background 
        end  
    end 

    def event_generator 
        a = rand(2)
        if a == 0
            monster_generator
        elsif a == 1
            quizmaster_generator 
        end 
    end 

    def monster_generator 
        num = rand(3) #add to this as I build more monsters
        if num == 0
            goblin_encounter 
        elsif num == 1
            dragon_encounter 
        elsif num == 2
            karen_encounter
        end 
    end 

    #THIS METHOD IS SO REPETITIVE ********
    def quizmaster_generator #is this method too long?
        luke = QuizMaster.new #i need to reference the player answer
        puts luke.greeting #so thats why I have to put everything into one method
        question = luke.question_generator
        puts luke.question
        player_answer = gets.strip.downcase 
        if question == luke.question_one
            if luke.one_answer.include?(player_answer) #should I make the questions just class methods?
                correct_answer
            else 
                wrong_answer
            end 
        elsif question == luke.question_two 
            if luke.two_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end 
        elsif question == luke.question_three 
            if luke.three_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end 
        elsif question == luke.question_four 
            if luke.four_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
        elsif question == luke.question_five 
            if luke.five_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end    
        elsif question == luke.question_six 
            if luke.six_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end 
        elsif question == luke.question_seven 
            if luke.seven_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end 
        elsif question == luke.question_eight 
            if luke.eight_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end 
        elsif question == luke.question_nine 
            if luke.nine_answer.include?(player_answer)
                correct_answer
            else 
                wrong_answer
            end  
        end    
    end  

    def correct_answer
        player.happiness = player.happiness + 1
        puts "Amazing! Your answer is correct, \n
        so Luke the Quiz Master left you alone. \n
        You feel so smart that your happiness increased by 1 point! \n
        Happiness: #{player.happiness}"
    end 

    def wrong_answer 
        player.happiness = player.happiness - 1
        puts "Luke the Quiz Master laughs at your wrong answer."
        puts "You're upset about giving the incorrect answer."
        puts "Happiness: #{player.happiness}"
    end 

    def goblin_encounter
        self.monster = Goblin.new
        puts "You've encountered a goblin! \n
        The Goblin shyly smiles and waves at you. \n"
    end  

    def dragon_encounter
        self.monster = Dragon.new  
        puts "Just your luck! You've encountered a fierce and sassy dragon! Yikes! \n
        *The Dragon farted.* \n
        The putrid smell is strong enough to make you forget your own name. \n"
    end 

    def karen_encounter
        self.monster = Karen.new 
        puts "Today is not your day! You've encountered a mighty Keh-Rhan! \n
        The monstrous Keh-Rhan makes your knees tremble. \n"
    end 

    def monster_encounter 
        monster_generator
        run_or_fight
    end 

    def run_or_fight
        puts "What will you do?"
        puts "Run or Fight?"
        choice = gets.strip 
        if run_or_fight.include?("run") || run_or_fight.include?("Run")
            self.run_away
        elsif run_or_fight.include?("fight") || run_or_fight.include?("Fight")
            self.battle #double check the logic of battle method
        else 
            puts "There is no third choice, sorry."
            puts "Please do try to stick with the choices that I've given you."
            run_or_fight
        end 
    end 

    def monster_reply
        if monster.health > 0
            puts monster.reply 
        end 
    end 

    def run_away
        puts "You've decided to run away...?! Wow, okay."
    end 

    def battle 
        puts "You've decided to battle! Great!"
        monster.battle_cry 
        #monsters begs and fights back only 
        until over?
            self.player_turn
            
            # self.monster_turn player_turn and monster_turn  
        end  
    end 

    # LOGIC: 
    # monster_generator
    # run_or_fight
    # if run_away, event_generator
    # if fight, #ask_player_for_battle_turn_choice
    # execute the choice received from player
    # show results
    # check if monster.health == 0 ; friendly_ending/bad-ending
    # if monster.health != 0
    #   monster.reply
    # elsif monster.health == 0
    #   monster.death_cry
    # monster's turn
    # monter randomly attacks
    # displays the result of monster's attack
    #
    
    def list_of_battle_choices
        puts "What will you do? (1-4) \n 
        1. Drink HP potion (+10 HP) \n
        2. Drink MP potion (+10 MP) \n
        3. Attack \n
        4. Ask the monster to be friends...? \n"
    end 

    def ask_player_for_battle_turn_choice
        list_of_battle_choices
        choice = gets.strip 
        if choice.include?("1") || choice.include?("HP") || choice.include?("hp")
            self.player.drink_health_potion
            puts "HP +10 \n
            HP: #{player.health}"
        elsif choice.include?("2") || choice.include?("MP") || choice.include?("mp")
            self.player.drink_mana_potion
            puts "MP +10 \n
            MP: #{player_mana}"
        elsif choice.include?("3") || choice == "attack" || choice == "Attack"
            self.choosing_attack
        elsif choice.include?("4") || choice.include?("nothing")
            self.player.do_nothing
        else 
            puts "Umm, #{player_name}... It's not hard to choose from 1-4. \n
            Please try again."
        end 
    end  

    def choosing_attack 
        puts player.set_of_attacks
        atk = gets.strip
        if atk.include?("1")
            dmg = player.first_attack #this section is repetitive
            monster.health -= dmg  #could write as its own method
            puts "You dealt #{dmg} damage! \n
            Monster's HP: #{monster.health}"
        elsif atk.include?("2")
            dmg = player.second_attack
            monster.health -= dmg 
            puts "You dealt #{dmg} damage! \n
            Monster's HP: #{monster.health}"
        elsif atk.include?("3")
            dmg = player.third_attack
            monster.health -= dmg 
            puts "You dealt #{dmg} damage! \n
            Monster's HP: #{monster.health}"
        else 
            puts "#{player_name}, you really only have three attacks to choose from. \n
            It's not that hard to choose. Please try again."
            choosing_attack
        end 
    end 

    def player_turn 
        counter = 0
        while !over? #could use this as a separate method
            self.ask_player_for_battle_turn_choice
            counter += 1
        end 
        if counter == 10 && self.monster.health > 0
            self.friends_made_save 
        elsif monster.health == 0 
            self.monsters_slain_save 
            self.increase_evilness
            puts "Oh... You actually killed the monster... \n
            Well, okay. \n
            Umm... You're not slightly more evil. \n
            Evilness Counter: #{player.evilness}"
        end 
    end 

    #this should be checked every turn the user is fighting a monster
    def over?
        if player.death? || self.friendly_ending? || self.bad_ending?
            true 
        end 
    end 
    
    def death?
        if self.player.death?
            puts "Your adventure was aight. \n
            Nothing to brag about. \n"
            restart?
        end 
    end 

    def restart?
        puts "Would you like to restart your adventure? \n
        Yes or No \n"
        a = gets.strip 
        if a == "yes" || a == "Yes" || a == "Ya" || a == "ya" || a == "y"
            RubytopiaGame.new 
         else 
            puts "Oh. Okay then. I won't take it personally. See you around?"
        end 
    end 

    #these methods should be cchecked every time a battle ends 
    def self.friendly_ending? 
        if self.player.friends_made_count == 5 
            puts "Your journey comes to an end, as you realize you have work tomorrow. \n
            As you are about to walk through the exit portal, \n
            all of the friends that you've made today came to bid farewell. \n"
            self.friends_made.each {|friend| puts "#{friend.name} said: See you around?"}
            restart?
        end 
    end 
    
    def self.bad_ending?
        if self.player.evilness == 10
            puts "I can't believe you are so cruel! \n
            But you know who loves cruel souls? \n
            Satan. \n
            Satan loves your soul so much that he decided to take it from you. \n
            Now your soul is part of Satan's favorite souls collection. \n
            Way to go, #{player_name}."
            restart?
        end 
    end 
end 

game_one = RubytopiaGame.new 
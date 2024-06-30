#ASSIGNMENT 3
#CODING IN R LANGUAGE
#Summer term 2024
#VIAN TRAN

#Hangman

#PLAN
#1. Prepare a dictionary of words to choose from and save it in a txt file (one column) 
#and save it in the project directory
#2. Read the word list from your program
#3. Choose a random element from the list
#Create a nice opening prompt to the game 
#4. Inform the user on the length of the secret word 
#5. Inform the user about the number of wrong guesses/tries allowed
#Decide on the rule here and implement it

#While loop (condition - when wrong guesses < max wrong guess then continue with loop) 
#Break: end it when guess word = secret word
#Notify users they won! 

#Text to display current state of the game for users

#6. Ask for user input
#7a. Check System for one character (IF)
  #Check if the character is a letter
  #Make sure that both lower and upper case letters are acceptable and treated as equivalent
#8a. Check to see if the user input is in the secret word (correct)
  #If yes, notify user and ask for next letter or guess the whole word
  #If not, notify user
      #If user has not exhausted the available tries repeat
      #OR 
      #If tries are exhausted, notify user that they’ve lost. Reveal secret and exit 
      #(This will bring it back to the while loop but the condition of 
      #wrong_guesses < max_wrong_guesses is not satisfied)

#7b. Check system if user input > 2 characters, doesn't have punctuation, spaces, etc. (ELSEIF)
  #This means the user tried guessing the full word and got it wrong
  #They need to try again
  #If they enter the wrong full word, they will not get any hints from entering that word

#7c. ELSE - invalid input try again

#LETS BEGIN

#Make sure you put your hangman.txt file in your working directory
#Set up your working directory
setwd("/Users/viantran/Downloads/MBiotech/MBiotech-Coding-in-R-Language")

#Clear environment
rm(list=ls())

#PREP WORK BEFORE THE GAME BEGINS 

#Load in and read the list of words from "hangman.txt", it will present it as a 
#character vector
word_list <- readLines("hangman.txt", warn = FALSE)

#Pick a random word from the list
#The sample() function will pick one word from the list
secret_word <- sample(word_list, 1)
#Provides the length of the secret word
secret_word_length <- nchar(secret_word)

#Number of wrong guesses allowed - head, body, 2 arms, 2 legs 
max_wrong_guesses <- 6

#Wrong guesses tracker, currently set to 0
wrong_guesses <- 0 

#Wrong guesses letter tracker, currently empty (displayed as a list)
wrong_guesses_list <- c()

#Correctly guessed letter tracker 
guessed_word <- rep("_", secret_word_length)

#Break the secret word into individual letters
#The strsplit function will split the elements of a character vector into substrings (a list)
#The unlist function will convert the list and produce a vector which contains all the 
#atomic components 
secret_word_letters <- unlist(strsplit(secret_word, ""))

#Initialize user_input variable as an empty character vector for later use
user_input <- character(0)

#Introductions to the game, character length of word, and rules 
cat("Welcome! Let's \"hang\" and play a quick game of Hangman! \n
Your secret word has been chosen and the length of the secret word is", 
    secret_word_length, "characters long. \nYou're allowed up to", 
    max_wrong_guesses, 
    "wrong guesses in this game.\nYou can enter one letter or if you think you know the word, OR you can enter the full word.\n
Good luck! We will be watching.\n
")

#The "while" loop is the main game play loop
#The loop will break when the players guess the full word correctly or when the condition
#wrong_guesses < max_wrong_guesses no long applies 
while(wrong_guesses < max_wrong_guesses) {

#Display the current state of the game
#Let the users know the letters they guessed correctly and incorrectly, and 
#The number of guesses they have left
  cat("Current progress:", paste(guessed_word), 
      "\nWrong guesses list:", paste(wrong_guesses_list), 
      "\nYou have", max_wrong_guesses - wrong_guesses, "wrong guesses left.\n")

#Prompt the user for an input, which will be converted to a lowercase letter for comparability
user_input <- tolower(readline(prompt = "Please enter a single letter or enter the full word:\n"))

#Check if the user input is a single character and a lowercase letter in the alphabet
  if (nchar(user_input) == 1 && grepl("[a-z]", user_input)){
#If the above line is true, check if the user input is a match in the secret word using %in%
    if(user_input %in% secret_word_letters){
      #If the user input is a match to a letter in the secret word, update the guessed_word
      #variable with the correct letter with a "for" loop 
      #The for loop will iterate over each index (i) from 1 to secret_word_length
      #It will check if the condition is true
      #If the character at position i in secret_word_letter matches the user_input, 
      #then guessed_word is updated with the correctly matched letter in secret_word_letter
      for (i in 1:secret_word_length){
        if (secret_word_letters[i] == tolower(user_input)){
          (guessed_word[i] <- secret_word_letters[i])
        }
      }
      cat("Good guess! You're right!\n")
    }
    else {
      #If the user inputs is not part of the secret word, update the wrong_guesses count 
      #and wrong_guesses_list with the user input
      #Add 1 wrong guess to the guess count variable (wrong_guesses)
      wrong_guesses <- wrong_guesses + 1
      #add the wrong guessed letter to the wrong_guess_list
      wrong_guesses_list <- c(wrong_guesses_list, user_input)
      cat("Wrong guess!\n")
    }
  }

  #Check if the user_input is more than a single character, alphabetical, and it doesn't 
  #include punctuation, digits, and spaces
  #This can be used when the user attempts to guess the whole word and are incorrect
  #Update the wrong guess count
  else if((nchar(user_input)) > 1 && grepl("[a-z]", user_input) && !(grepl("\\d", user_input)) 
  && !(grepl("[[:punct:]]", user_input)) && !(grepl("[[:space:]]", user_input))){
    if(tolower(user_input) == secret_word){
      cat("Congratulations! You've gusses the right word! The answer was", secret_word, "\nand you answered it with", 
         max_wrong_guesses - wrong_guesses, "guesses left. You didn't get hanged today! Slay!\n")
    break
    }
else {
    wrong_guesses <- wrong_guesses + 1 
    cat("Wrong guess!\n")
  }
} 
#If all the above conditions are false when wrong_guesses < max_wrong_guesses, 
#the user input was invalid and they need to try again
  else{
    cat("Invalid input, please try again! Please enter a letter, or guess the full word.\n")
  }
#No penalties when the input was invalid (ie. numbers, spaces, etc.)
}
#This is the end of the main loop when wrong_guesses < max_wrong_guesses

#If number of wrong guesses = max wrong guesses, the game is over
if(wrong_guesses == max_wrong_guesses) {
    cat("Unfortunately, you have used up all of your guesses. You have been hanged. \nWOMP WOMP! The answer was \"",
        secret_word, "\". Better luck next time.")
  }


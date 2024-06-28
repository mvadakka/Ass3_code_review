#ASSIGNMENT 3
#CODING IN R LANGUAGE
#Summer term 2024
#VIAN TRAN

#Hangman

#PLAN
#1. Prepare a dictionary of words to choose from and save it in a txt file (one column) 
#and save it in the project directory
#2. Read the word list from your program.
#3. Choose a random element from the list.
#Hint: You may want to check sample() and sample.int() functions (or other methods).
#Create a nice opening prompt to the game
#4. Inform the user on the length of the secret word. Hint: You may test nchar()
#5. Inform the user about the number of wrong guesses/tries allowed. 
#Decide on the rule here and implement it.
#6. Ask for user input. The user is expected to enter one character only.
#7. Check System for one character 
  #check if the character is a letter
  #make sure that both lower and upper case letters are acceptable and treated as equivalent
#SIDE NOTE - create a vector to keep track of correctly guessed letters
#8. Check to see if the user input is in the secret word.
  #If yes, notify user and ask for next letter or guess the whole word
      #Always notify the user about the correct letters/wrong letters, remaining tries.
      #Provide the user with a visual clue of how they are progressing.
  #If not, notify user.
      #If user has not exhausted the available tries, ask for the next letter.
      #Always notify the user about the correct letters/wrong letters, remaining tries.
      #OR
      #If tries are exhausted, notify user that they’ve lost. Reveal secret and exit.

##DISPLAY a hangman like game, have the _ _ _ _ spaces for each letter, have a wrong guesses
#section - MAKE IT FUN! 

#make sure you put your hangman.txt file in your working directory, replace it with your wd
setwd("/Users/viantran/Downloads/MBiotech/MBiotech-Coding-in-R-Language")

#load in and read the list of words from "hangman.txt", it will present it as a 
#character vector
word_list <- readLines("hangman.txt", warn = FALSE)

#pick a random word from the list
#the sample() function will pick one word from the list
secret_word <- sample(word_list, 1)
secret_word_length <- nchar(secret_word)

#number of wrong guesses allowed
max_wrong_guesses <- 5

#wrong guesses used, currently set to 0 
wrong_guesses <- 0 

cat("Your secret word has been chosen and the length of the secret word is", 
                secret_word_length, "characters long. \nYou are allowed up to",
    max_wrong_guesses, "wrong guesses in this game!")




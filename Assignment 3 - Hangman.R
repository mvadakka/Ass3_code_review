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

#While loop (condition - when wrong guesses < max wrong guess then continue with loop) 
#Break: end it when wrong guesses = max wrong guess = game over OR guess word = secret word
#Notify user that they’ve lost. Reveal secret and exit. OR Notify they won! 

#Text to display current state of the game for users.

#6. Ask for user input.
#7a. Check System for one character (IF)
  #Check if the character is a letter
  #Make sure that both lower and upper case letters are acceptable and treated as equivalent
#SIDE NOTE - create a vector to keep track of correctly guessed letters
#8a. Check to see if the user input is in the secret word. (correct)
  #If yes, notify user and ask for next letter or guess the whole word
      #Always notify the user about the correct letters/wrong letters, remaining tries.
      #Provide the user with a visual clue of how they are progressing - update _ _ _ _ with 
      #correct guessed letters 
  #If not, notify user.
      #If user has not exhausted the available tries repeat.
      #Always notify the user about the correct letters/wrong letters, remaining tries.
      #Provide the user with a visual clue of how they are progressing - update _ _ _ _ with 
      #correct guessed letters 
      #OR 
      #If tries are exhausted, notify user that they’ve lost. Reveal secret and exit. (This 
      #will bring it back to the while loop which will break when # of wrong guesses = max 
      #wrong guesses)

#7b. Check system if user input = secret word (full answer) (ELSEIF)
  #Make sure that both lower and upper case letters are acceptable and treated as equivalent
  #Congratulation prompt
  #Provide the user with a visual clue of how their progress - _ _ _ _ with correct letters 
  #Always notify the user about the correct letters/wrong letters, remaining tries.
  #OR
  #If full answer input is not secret word, notify user that they've lost. Reveal secret 
  #and exit. (This will bring it back to the while loop which will break when # of 
  #wrong guesses = max wrong guesses)

#7c. ELSE - invalid input try again
  #Always notify the user about the correct letters/wrong letters, remaining tries.
  #Provide the user with a visual clue of how they are progressing - update _ _ _ _ with 
  #correct guessed letters.

##DISPLAY a hangman like game, have the _ _ _ _ spaces for each letter, have a wrong guesses
#section - MAKE IT FUN! 

#make sure you put your hangman.txt file in your working directory, replace it with your wd
setwd("/Users/viantran/Downloads/MBiotech/MBiotech-Coding-in-R-Language")

#clear environment
rm(list=ls())

#PREP WORK BEFORE THE HANGMAN FUNCTION
#load in and read the list of words from "hangman.txt", it will present it as a 
#character vector
word_list <- readLines("hangman.txt", warn = FALSE)

#pick a random word from the list
#the sample() function will pick one word from the list
secret_word <- sample(word_list, 1)
#provides the length/number of characters of the secret word
secret_word_length <- nchar(secret_word)

#number of wrong guesses allowed - head, body, 2 arms, 2 legs 
max_wrong_guesses <- 6

#wrong guesses tracker, currently set to 0 (helps us keep track of the number of wrong guesses)
wrong_guesses <- 0 

#wrong guesses letter tracker, currently empty (helps us keep track of the letters already 
#guessed)
wrong_guesses_list <- c()

#correctly guessed letter tracker 
guessed_word <- rep("_", secret_word_length)

#introductions to the game, character length of word, and rules 
cat("Welcome to the game of hangman! Let's \"hang\" and play a quick game! \n
Your secret word has been chosen and the length of the secret word is", 
    secret_word_length, "characters long. \nYou're allowed up to", 
    max_wrong_guesses, 
    "wrong guesses in this game.\nYou can enter one letter or if you think you know the word, you can enter the full word. \n
Good luck! We will be watching.")

#while loop is the main game play loop. The loop will break when the players makes 6 wrong
#guesses or they guess the full word correctly or incorrectly
while(wrong_guesses < max_wrong_guesses) {

#if number of wrong guesses = max wrong guesses or user_input = secret word,
#break the loop and exit
  if(wrong_guesses == max_wrong_guesses | user_input == secret_word) {
    if(wrong_guesses == max_wrong_guesses){
      cat("Unfortunately, you have used up all of your guesses. You have been hanged. \nWOMP WOMP! The answer was \"",
        secret_word, "\". Better luck next time.")
    }
    else{
      cat("Congratulations! You've gusses the right word! The answer was", secret_word, "\nand you answered it with", 
          max_wrong_guesses - wrong_guesses, "guesses left. You didn't get hanged today! Slay!")
    }
    break
  }
  
#display the current state of the game
#let the users know the letters the guessed correctly, wrong letters guessed, and 
#the number of guesses they have left

  
  
}

#6. Ask for user input.
#7a. Check System for one character (IF)
#Check if the character is a letter
#Make sure that both lower and upper case letters are acceptable and treated as equivalent
#SIDE NOTE - create a vector to keep track of correctly guessed letters
#8a. Check to see if the user input is in the secret word. (correct)
#If yes, notify user and ask for next letter or guess the whole word
#Always notify the user about the correct letters/wrong letters, remaining tries.
#Provide the user with a visual clue of how they are progressing - update _ _ _ _ with 
#correct guessed letters 
#If not, notify user.
#If user has not exhausted the available tries repeat.
#Always notify the user about the correct letters/wrong letters, remaining tries.
#Provide the user with a visual clue of how they are progressing - update _ _ _ _ with 
#correct guessed letters 
#OR 
#If tries are exhausted, notify user that they’ve lost. Reveal secret and exit. (This 
#will bring it back to the while loop which will break when # of wrong guesses = max 
#wrong guesses)

#7b. Check system if user input = secret word (full answer) (ELSEIF)
#Make sure that both lower and upper case letters are acceptable and treated as equivalent
#Congratulation prompt
#Provide the user with a visual clue of how their progress - _ _ _ _ with correct letters 
#Always notify the user about the correct letters/wrong letters, remaining tries.
#OR
#If full answer input is not secret word, notify user that they've lost. Reveal secret 
#and exit. (This will bring it back to the while loop which will break when # of 
#wrong guesses = max wrong guesses)

#7c. ELSE - invalid input try again
#Always notify the user about the correct letters/wrong letters, remaining tries.
#Provide the user with a visual clue of how they are progressing - update _ _ _ _ with 
#correct guessed letters.
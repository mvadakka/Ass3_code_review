#ASSIGNMENT 3
#CODING IN R LANGUAGE
#Summer term 2024
#VIAN TRAN

#PLAN
#1. Prepare a dictionary of words to choose from and save it in a txt file (one column) 
#and save it in the project directory
#2. Read the word list from your program.
#3. Choose a random element from the list.
#Hint: You may want to check sample() and sample.int() functions (or other methods).
#4. Inform the user on the length of the secret word. Hint: You may test nchar()
#5. Inform the user about the number of wrong guesses/tries allowed. 
#Decide on the rule here and implement it.
#6. Ask for user input. The user is expected to enter one character only.
#7. Check System for one character 
  #check if the character is a letter
  #make sure that both lower and upper case letters are acceptable and treated as equivalent
#8. Check to see if the user input is in the secret word.
  #If yes, notify user and ask for next letter or guess the whole word
      #Always notify the user about the correct letters/wrong letters, remaining tries.
      #Provide the user with a visual clue of how they are progressing.
  #If not, notify user.
      #If user has not exhausted the available tries, ask for the next letter.
      #Always notify the user about the correct letters/wrong letters, remaining tries.
      #OR
      #If tries are exhausted, notify user that they’ve lost. Reveal secret and exit.


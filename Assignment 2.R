#ASSIGNMENT 2
#CODING IN R LANGUAGE
#JUNE 2024
#VIAN TRAN

#PLAN
#1. Prompt and read user input (enter 3 digit positive number)
#2. Check if the number if numeric, if not print error message and exit 
#3. Check if the number is a 3 digit positive number (number < 1000 and > 99), if not print error message 
# and quit
#4. If all of the above are TRUE, we need to extract each digit in the 3 digit positive number to then
#calculate for a narcissistic number
#5. Check if the number is narcissistic (a number that is equal to the sum of the cubes of its own digits) 
#if TRUE - display number is a narcissistic number  
#if FALSE - display number is not a narcissistic number 

#prompt the user to enter in a 3 digit positive number and save it in the environment under "number"
number <- readline(prompt = "Please enter a three-digit positive number:  ")

#the number vector is a character vector, we need to convert it to a numeric vector
number <- as.numeric(number)

#Checking system 
#Check if the number is numeric. TRUE indicates it is not numeric
if (is.na(number)) {
  print(paste(number, "is not numeric, please try again and input a 3 digit positive number!"))
#Check if the number is a 3 digit positive number. TRUE indicates it is not a 3 digit positive number
} else if (number >= 1000 | number <= 99) {
  print(paste(number, "is not a 3 digit positive number, please try again and input a 3 digit positive number!"))
#If all the above are FALSE, the number is numeric and a 3 digit positive number.
} else {
  print(paste(number, "is a 3 digit positive number! Congrats! Let's see if it is narcississtic."))
}

###SHOULD THIS BE INSIDE OR OUTSIDE THE ELSE FUNCTION?!?!? 
#Split the 3 digit positive number into its individual digits (ie. 123 into 1, 2, and 3)
#We can use the strsplit function by reading the number with as.character 
#We can then unlist the resulting list of individual digits from above and create a vector of character 
#using unlist function
#We can finally convert the vector of character into a numeric vector and read the output with as.numeric 

individual_character <- strsplit(as.character(number), "")
individual_digit <- as.numeric(unlist(individual_character))

#Sum the cubes of its own digits
sum_of_cubes <- sum(individual_digit^3)
if (sum_of_cubes == number) {
  print(paste(number, "is a narcissistic number! Congratulations! Great pick!"))
} else {
  print(paste("Sorry, please do better next time,", number, "is not a narcissistic number. Do better."))
}








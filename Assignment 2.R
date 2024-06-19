#ASSIGNMENT 2
#CODING IN R LANGUAGE
#Summer term 2024
#VIAN TRAN

#PLAN
#1. Prompt and read user input (enter 3 digit positive number)
#2. Check if the number if numeric, if not print error message and exit 
#3. Check if the number is a 3 digit positive number (number < 1000 and > 99), if not print error message 
# and exit
#4. If all of the above are TRUE, we need to extract each digit in the 3 digit positive number to then
#calculate for a narcissistic number
#5. Check if the number is narcissistic (a number that is equal to the sum of the cubes of its own digits) 
#if TRUE - display number is a narcissistic number  
#if FALSE - display number is not a narcissistic number 

#Prompt the user to enter in a 3 digit positive number and save it in the environment as variable "number"
number <- readline(prompt = "Please enter a three-digit positive number:  ")

#The "number" variable is a character vector, we need to convert it to a numeric vector for further use
number <- as.numeric(number)

#Checking system: 
#Check if the number is numeric. TRUE indicates it is not numeric. if TRUE stop the code
if (is.na(number)) {
  stop(paste(number, "is not numeric, please try again and input a 3 digit positive number!"))
#Check if the number is a 3 digit positive number. TRUE indicates it is not a 3 digit positive number,
#if TRUE stop the code
} else if (number >= 1000 | number <= 99) {
  stop(paste(number, "is not a 3 digit positive number, please try again and input a 3 digit positive number!"))
#If all of the above conditions are FALSE, the number is numeric and a 3 digit positive number.
} else {
  print(paste(number, "is a 3 digit positive number! Congrats! Let's see if it is narcississtic."))

#To sum the cubes of each individual digit in the 3 digit positive number,
#we need to split the 3 digit positive number into its individual digits (ie. 123 into 1, 2, and 3)

#We can split the elements of a character vector using the strsplit function by first reading the 3
#digit positive number as characters

individual_character <- strsplit(as.character(number), "")

#The strsplit function will display the results as a list. To calculate the sum of cubes of each
#individual digit, we need to create a vector from the list by using the unlist function
#We finally need to convert the vector of characters to a numeric vector for further use

individual_digit <- as.numeric(unlist(individual_character))

#Sum the cubes of each individual digit from the 3 digit positive number (ie. 123 -> 1^3 + 2^3 + 3^3)
sum_of_cubes <- sum(individual_digit^3)
#Check if the sum of cubes of each individual digit is equal to the 3 digit positive number you entered
#If the condition is true, the number is a narcissistic number
if (sum_of_cubes == number) {
  print(paste(number, "is a narcissistic number! Congratulations! Great pick!"))
#If the above condition if false, the 3 digit positive number is not a narcissistic number
} else {
  print(paste("Sorry, please do better next time,", number, "is not a narcissistic number. Do better."))
}
}







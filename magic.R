## Create matrix 7x3 number rows = 7 and number columns = 3
m = matrix( c(1:21), nrow=7, ncol=3, byrow=TRUE )

## Print
print("Welcome to the Magic game")
print("Please remember a number in this matrix")
## Print the matrix
print(m)

NotDone = TRUE
turn = 0
previous = FALSE

while( NotDone){
print("Please enter the column number your number is in: .")
print("Choose a number to remember from the below matrix.")

## Get the user input
n <- readline(prompt="Enter an integer: ")
n <- as.integer(n) ## Convert the user input 'n' to an integer
  
  ## if n is not numeric then print n is not a number
  if (!is.numeric(n)){
    print("n is not a number")

    ##need to exit
  }

  if(n > 3){
    print("n should not be a number greater than 3")

    ## need to exit
  }

##If n is the first (1st) column then make it the middle column by swapping it with column 2 e.g. c(2,1,3)
if(n == 1){
  m = m[, c(2,1,3)]
}
else if(n == 3)##If n is the last (3rd) column then make it the middle column by swapping it with column 2 e.g. c(1,3,2)
{
  m = m[, c(1,3,2)]
}
##else if(n == 2){#If n is the second (2nd) column then swap columns 1 and 3 e.g. c(3,2,1)
  ##m = m[, c(1,3,2)]
##}

##The "Shuffle"
m = matrix( m, nrow=7, ncol=3, byrow = TRUE)


## Print the matrix again
print(m)


if(previous == TRUE){
  NotDone = FALSE
}

if(turn !=0 && n ==2 )
{
  previous =TRUE

}
turn = turn + 1
}

print("Your number is:")
print(m[4,2])


#!/bin/bash

# A simple random number guessing game 
# Author: Anirban Dutta
# Date: Mon Apr 2, 2018

displaygame()
{
title="| $1 |"
border=$(echo "$title" | sed 's/./-/g')
echo "$border"
echo "$title"
echo "$border"
}

displaygame "Guess a number between 1 to 30"

highest=30
tried_guess=0
total_guesses=0
rand_number=$(( 1 + ($RANDOM % $highest) )) # generates a random number in the range of 1 to 30

while [ $tried_guess -ne $rand_number ] ; do 
echo -n "Enter a Guess: " ; 
read tried_guess
if ! [[ "$tried_guess" =~ ^[0-9]+$ ]] ; then 
echo "Enter only integers please.... try again!" ;
exit 1
elif [ "$tried_guess" -lt $rand_number ] ; then 
echo " ... try a higher number! "
elif [ "$tried_guess" -gt $rand_number ] ; then 
echo " ... try a smaller number! " 
elif [ "$tried_guess" -eq $rand_number ] ; then
echo "Right! You guessed $rand_number in $(( $total_guesses + 1 )) guesses." 
fi 
total_guesses=$(( $total_guesses + 1 ))
done
exit 0

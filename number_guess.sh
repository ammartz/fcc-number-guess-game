#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")

if [[ -z $USER_ID ]]
then
INSERT_USER=$($PSQL "insert into users(name) values('$USERNAME')")
USER_NAME=$($PSQL "select name from users where user_id='$USER_ID'")
echo "Welcome, $USERNAME! It looks like this is your first time here."
else
USER_NAME=$($PSQL "select name from users where user_id='$USER_ID'")
GAMES_PLAYED=$($PSQL "select count(*) from games where user_id='$USER_ID'")
BEST_GAME=$($PSQL "select min(tries) from games where user_id='$USER_ID'")
echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
R=$(($RANDOM%1000))
read GUESS
GUESS_COUNT=0

CHECK_GUESS(){
RE='^[0-9]+$'
if  [[ $GUESS =~ $RE ]]
then


if [[ $GUESS = $R ]]
then
GUESS_COUNT=$(($GUESS_COUNT+1))
USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
INSERT_GAME=$($PSQL "insert into games(user_id, tries) values($USER_ID, $GUESS_COUNT)")
echo "You guessed it in $GUESS_COUNT tries. The secret number was $R. Nice job!"
fi

if [[ $GUESS > $R ]]
then
echo "It's lower than that, guess again:"
GUESS_COUNT=$(($GUESS_COUNT+1))
read GUESS
CHECK_GUESS
fi

if [[ $GUESS < $R ]]
then
echo "It's higher than that, guess again:"
GUESS_COUNT=$(($GUESS_COUNT+1))
read GUESS
CHECK_GUESS
fi

else
echo "That is not an integer, guess again:"
read GUESS
CHECK_GUESS
fi
}

CHECK_GUESS

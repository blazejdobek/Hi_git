#!/bin/bash

function git_commit() {
  export D=$1
  export M=$2
  export Y=$3

  export GIT_COMMITTER_DATE="$Y-$M-$D 09:09:09"
  export GIT_AUTHOR_DATE="$Y-$M-$D 09:09:09"

  echo $RANDOM > README.md
  git add .

  git commit --date="$Y-$M-$D 09:09:09" -m "Hi there!"
}

function number_of_days_in_month() {
  month=$1

  case $month in
    1|3|5|7|8|10|12 ) echo "31";;
    4|6|9|11 ) echo "30";;
    2 ) echo "28";;
  esac
}

#- - - - - - - - - -
# Letters
#- - - - - - - - - -


empty_letter_matrix=(
"0 0 0 0"
"0 0 0 0"
"0 0 0 0"
"0 0 0 0"
"0 0 0 0"
"0 0 0 0"
"0 0 0 0")

e_letter_matrix=(
"0 0 0 0"
"1 1 1 1"
"1 0 0 0"
"1 1 1 0"
"1 0 0 0"
"1 1 1 1"
"0 0 0 0")

h_letter_matrix=(
"0 0 0 0"
"1 0 0 1"
"1 0 0 1"
"1 1 1 1"
"1 0 0 1"
"1 0 0 1"
"0 0 0 0")

i_letter_matrix=(
"0 0 0 0"
"0 0 1 0"
"0 0 1 0"
"0 0 1 0"
"0 0 1 0"
"0 0 1 0"
"0 0 0 0")

l_letter_matrix=(
"0 0 0 0"
"1 0 0 0"
"1 0 0 0"
"1 0 0 0"
"1 0 0 0"
"1 1 1 1"
"0 0 0 0")

n_letter_matrix=(
"0 0 0 0"
"0 0 0 0"
"1 1 1 1"
"1 0 0 1"
"1 0 0 1"
"1 0 0 1"
"0 0 0 0")

o_letter_matrix=(
"0 0 0 0"
"0 1 1 0"
"1 0 0 1"
"1 0 0 1"
"1 0 0 1"
"0 1 1 0"
"0 0 0 0")

s_letter_matrix=(
"0 0 0 0"
"0 1 1 1"
"1 0 0 0"
"0 1 1 0"
"0 0 0 1"
"1 1 1 0"
"0 0 0 0")

exclamation_mark_matrix=(
"0 0 0 0"
"0 0 1 0"
"0 0 1 0"
"0 0 1 0"
"0 0 0 0"
"0 0 1 0"
"0 0 0 0")

smile_mark_matrix=(
"0 0 0 0"
"0 0 1 0"
"0 1 0 1"
"0 0 0 1"
"0 1 0 1"
"0 0 1 0"
"0 0 0 0")


function get_element_of_letter_matrix() {
  matrix=("${!1}")
  i=$2
  j=$3

  row=${matrix[$i]}
  element=$(echo $row | awk -v j="$((j+1))" '{print $j}')

  echo $element
}


# start date
year=2020
month=1
day=5

row_index=0
column_index=0
max_rows=7
max_columns=4

number_of_drawn_letter=0

while (( year < 2021 )); do


#- - - - - - - - - -
# Track current day, month, and year
#- - - - - - - - - -

  day=$((day + 1))

  max_days=$(number_of_days_in_month $month)
  if (( day > max_days )); then
    day=1
    month=$((month + 1))
  fi

  if (( month > 12 )); then
    month=1
    year=$((year + 1))
  fi


#- - - - - - - - - -  
# Letter drawing
#- - - - - - - - - - 

  letter=()

  case $number_of_drawn_letter in
    0 ) letter=( "${empty_letter_matrix[@]}" );;
    1 ) letter=( "${empty_letter_matrix[@]}" );;
    2 ) letter=( "${empty_letter_matrix[@]}" );;
    3 ) letter=( "${empty_letter_matrix[@]}" );;
    4 ) letter=( "${empty_letter_matrix[@]}" );;
    5 ) letter=( "${h_letter_matrix[@]}" );;
    6 ) letter=( "${i_letter_matrix[@]}" );;
    7 ) letter=( "${exclamation_mark_matrix[@]}" );;
    8 ) letter=( "${empty_letter_matrix[@]}" );;
    9 ) letter=( "${empty_letter_matrix[@]}" );;
    10 ) letter=( "${empty_letter_matrix[@]}" );;
    * ) letter=();;
  esac

  draw_pixel=0
  if [ ${#letter[@]} -gt 0 ]; then
    draw_pixel=$(get_element_of_letter_matrix letter[@] $row_index $column_index)
  fi

  # Track current position in the letter matrix
  row_index=$(( row_index + 1 ))
  if (( row_index % max_rows == 0)); then
    row_index=0
    column_index=$(( column_index + 1 ))
  fi
  if (( column_index != 0 )) && ((column_index % max_columns == 0)); then
    column_index=0
    number_of_drawn_letter=$(( number_of_drawn_letter + 1 ))
  fi


#- - - - - - - - - -
# Create git commits
#- - - - - - - - - -

  number_of_commits=0

  case $draw_pixel in
    0 ) number_of_commits=1 ;;
    1 ) number_of_commits=10 ;;
  esac

  while [ $number_of_commits -gt 0 ]; do
    number_of_commits=$(( number_of_commits - 1 ))
    git_commit $day $month $year
  done

done

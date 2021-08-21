#!/bin/sh

wantfile="Makefile"

if [ -z "$1" -o "$1" != "--dot" ]
then
  needDot=0
else
  needDot=1
fi

dir=$(pwd)

found=""

while [ -z "$found" ] && [ ! -z "$dir" ]
do
  if [ -e "$dir/$wantfile" ]
  then
    if [ "$needDot" = "1" ]
    then
      if [ -e "$dir/.rootmake" ]
      then
        found="$dir/$wantfile"
        break
      fi
    else
      found="$dir/$wantfile"
      break
    fi
  fi
  dir=${dir%/*}
done

if [ ! -z "$found" ]
then
  make -C "$dir" $2
fi

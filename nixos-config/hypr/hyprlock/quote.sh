#!/usr/bin/env bash

mapfile -t quotes <<'QUOTES'
"Stay hungry, stay foolish." — Steve Jobs
"First, solve the problem. Then, write the code." — John Johnson
"Simplicity is prerequisite for reliability." — Edsger W. Dijkstra
"Programs must be written for people to read." — Harold Abelson
"Make it work, make it right, make it fast." — Kent Beck
"The best error message is the one that never shows up." — Thomas Fuchs
"Discipline is choosing between what you want now and what you want most." — Abraham Lincoln
"Small progress every day adds up to big results." — Unknown
"Consistency beats intensity when intensity is unsustainable." — Unknown
"Don’t watch the clock; do what it does. Keep going." — Sam Levenson
QUOTES

count=${#quotes[@]}
if (( count == 0 )); then
  exit 1
fi

index=$((RANDOM % count))
printf '%s\n' "${quotes[index]}"

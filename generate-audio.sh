#!/bin/zsh
cd /Users/nencyyera/Desktop/apps-and-games/aziels-star-world/audio

VOICE="Samantha"
RATE=140

# Word files
words=(Apple Banana Milk Cookie Water Juice Mama Dada Baby Love Hug Kiss Dog Cat Fish Bird Bear Bunny Red Blue Green Yellow Orange Purple Hi Bye Yes No Please More)

for word in "${words[@]}"; do
  lower=$(echo "$word" | tr '[:upper:]' '[:lower:]')
  say -v "$VOICE" -r $RATE -o "${lower}.aiff" "$word"
  afconvert "${lower}.aiff" "${lower}.m4a" -f m4af -d aac
  rm "${lower}.aiff"
  echo "word: $word"
done

# Praise phrases
praises=("Great job" "Yay" "You got it" "Awesome" "Super" "Perfect" "Amazing, you did it")
pnames=(greatjob yay yougotit awesome super perfect amazingyoudidit)

for i in {1..${#praises[@]}}; do
  say -v "$VOICE" -r 160 -o "${pnames[$i]}.aiff" "${praises[$i]}"
  afconvert "${pnames[$i]}.aiff" "${pnames[$i]}.m4a" -f m4af -d aac
  rm "${pnames[$i]}.aiff"
  echo "praise: ${praises[$i]}"
done

# "This one is ___" for wrong answers
for word in "${words[@]}"; do
  lower=$(echo "$word" | tr '[:upper:]' '[:lower:]')
  say -v "$VOICE" -r 150 -o "thisis_${lower}.aiff" "This one is ${word}"
  afconvert "thisis_${lower}.aiff" "thisis_${lower}.m4a" -f m4af -d aac
  rm "thisis_${lower}.aiff"
  echo "thisis: $word"
done

echo "ALL DONE"

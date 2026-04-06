#!/bin/zsh
# Re-record with Shelley (newer, more natural macOS voice)
# Then embed as base64 directly into a JS file

cd /Users/nencyyera/Desktop/apps-and-games/aziels-star-world/audio

VOICE="Shelley (English (US))"
RATE=130

# Clean old files
rm -f *.m4a *.aiff

# Words
words=(Apple Banana Milk Cookie Water Juice Mama Dada Baby Love Hug Kiss Dog Cat Fish Bird Bear Bunny Red Blue Green Yellow Orange Purple Hi Bye Yes No Please More)

for word in "${words[@]}"; do
  lower=$(echo "$word" | tr '[:upper:]' '[:lower:]')
  say -v "$VOICE" -r $RATE -o "${lower}.aiff" "$word"
  afconvert "${lower}.aiff" "${lower}.m4a" -f m4af -d aac
  rm "${lower}.aiff"
  echo "word: $word"
done

# Praises
praises=("Great job" "Yay" "You got it" "Awesome" "Super" "Perfect" "Amazing, you did it")
pnames=(greatjob yay yougotit awesome super perfect amazingyoudidit)

for i in {1..${#praises[@]}}; do
  say -v "$VOICE" -r 150 -o "${pnames[$i]}.aiff" "${praises[$i]}"
  afconvert "${pnames[$i]}.aiff" "${pnames[$i]}.m4a" -f m4af -d aac
  rm "${pnames[$i]}.aiff"
  echo "praise: ${praises[$i]}"
done

# "This one is ___"
for word in "${words[@]}"; do
  lower=$(echo "$word" | tr '[:upper:]' '[:lower:]')
  say -v "$VOICE" -r 140 -o "thisis_${lower}.aiff" "This one is ${word}"
  afconvert "thisis_${lower}.aiff" "thisis_${lower}.m4a" -f m4af -d aac
  rm "thisis_${lower}.aiff"
  echo "thisis: $word"
done

echo "=== RECORDINGS DONE ==="

# Now generate a JS file with all audio as base64 data URIs
echo "Generating embedded audio JS..."

JSFILE="/Users/nencyyera/Desktop/apps-and-games/aziels-star-world/audio-data.js"
echo "// Auto-generated audio data - Shelley voice" > "$JSFILE"
echo "const AUDIO_DATA = {" >> "$JSFILE"

first=true
for f in *.m4a; do
  name="${f%.m4a}"
  b64=$(base64 -i "$f")
  if [ "$first" = true ]; then
    first=false
  else
    echo "," >> "$JSFILE"
  fi
  printf "  \"%s\": \"data:audio/mp4;base64,%s\"" "$name" "$b64" >> "$JSFILE"
done

echo "" >> "$JSFILE"
echo "};" >> "$JSFILE"

echo "=== ALL DONE ==="
ls -lh "$JSFILE"

#!/bin/zsh
# Re-record all audio with Samantha voice - SLOWER for clarity!
# Rate 130 = clear and easy for a 3-year-old to understand
VOICE="Samantha"
DIR="$HOME/Desktop/apps-and-games/aziels-star-world/audio"
cd "$DIR"

echo "🎙️ Re-recording with $VOICE at SLOWER rates for clarity..."

# Single words — rate 130 (was 155, way too fast!)
for word in apple banana milk cookie water juice mama dada baby love hug kiss dog cat fish bird bear bunny red blue green yellow orange purple hi bye yes no please more; do
    NICE="$(echo $word | sed 's/^./\U&/')"
    say -v "$VOICE" -r 130 "$NICE" -o "$DIR/${word}.m4a"
    echo "  ✅ $word"
done

# Praise phrases — rate 125 (warm, enthusiastic, clear)
say -v "$VOICE" -r 125 'Great job!' -o "$DIR/greatjob.m4a"
echo "  ✅ greatjob"
say -v "$VOICE" -r 125 'Yay!' -o "$DIR/yay.m4a"
echo "  ✅ yay"
say -v "$VOICE" -r 125 'You got it!' -o "$DIR/yougotit.m4a"
echo "  ✅ yougotit"
say -v "$VOICE" -r 125 'Awesome!' -o "$DIR/awesome.m4a"
echo "  ✅ awesome"
say -v "$VOICE" -r 125 'Super!' -o "$DIR/super.m4a"
echo "  ✅ super"
say -v "$VOICE" -r 125 'Yes!' -o "$DIR/yes_praise.m4a"
echo "  ✅ yes_praise"
say -v "$VOICE" -r 125 'Perfect!' -o "$DIR/perfect.m4a"
echo "  ✅ perfect"
say -v "$VOICE" -r 125 'Hurray!' -o "$DIR/hurray.m4a"
echo "  ✅ hurray"
say -v "$VOICE" -r 120 'Amazing! You did it!' -o "$DIR/amazingyoudidit.m4a"
echo "  ✅ amazingyoudidit"
say -v "$VOICE" -r 125 'Woo hoo!' -o "$DIR/woo_hoo.m4a"
echo "  ✅ woo_hoo"

# "This is ___" phrases — rate 130 (clear and warm)
for word in apple banana milk cookie water juice mama dada baby love hug kiss dog cat fish bird bear bunny red blue green yellow orange purple hi bye yes no please more; do
    NICE="$(echo $word | sed 's/^./\U&/')"
    say -v "$VOICE" -r 130 "This is ${NICE}!" -o "$DIR/thisis_${word}.m4a"
    echo "  ✅ thisis_$word"
done

echo ""
echo "🎉 All done! $(ls *.m4a | wc -l | tr -d ' ') audio files re-recorded SLOWER!"
echo "Now run: rebuild audio-data.js and re-embed in index.html"

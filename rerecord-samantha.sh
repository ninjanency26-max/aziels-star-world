#!/bin/zsh
# Re-record all audio with Samantha voice (warmer & friendlier for kids!)
VOICE="Samantha"
RATE=155
DIR="$HOME/Desktop/apps-and-games/aziels-star-world/audio"
cd "$DIR"

echo "🎙️ Recording with $VOICE at rate $RATE..."

# Single words
for word in apple banana milk cookie water juice mama dada baby love hug kiss dog cat fish bird bear bunny red blue green yellow orange purple hi bye yes no please more; do
    # Capitalize first letter for nicer pronunciation
    NICE="$(echo $word | sed 's/^./\U&/')"
    say -v "$VOICE" -r $RATE "$NICE" -o "$DIR/${word}.m4a"
    echo "  ✅ $word"
done

# Praise phrases (slightly slower, more enthusiastic)
say -v "$VOICE" -r 145 "Great job!" -o "$DIR/greatjob.m4a"
echo "  ✅ greatjob"
say -v "$VOICE" -r 145 "Yay!" -o "$DIR/yay.m4a"
echo "  ✅ yay"
say -v "$VOICE" -r 145 "You got it!" -o "$DIR/yougotit.m4a"
echo "  ✅ yougotit"
say -v "$VOICE" -r 145 "Awesome!" -o "$DIR/awesome.m4a"
echo "  ✅ awesome"
say -v "$VOICE" -r 145 "Super!" -o "$DIR/super.m4a"
echo "  ✅ super"
say -v "$VOICE" -r 145 "Yes!" -o "$DIR/yes_praise.m4a"
echo "  ✅ yes (praise)"
say -v "$VOICE" -r 145 "Perfect!" -o "$DIR/perfect.m4a"
echo "  ✅ perfect"
say -v "$VOICE" -r 145 "Hurray!" -o "$DIR/hurray.m4a"
echo "  ✅ hurray"
say -v "$VOICE" -r 140 "Amazing! You did it!" -o "$DIR/amazingyoudidit.m4a"
echo "  ✅ amazingyoudidit"
say -v "$VOICE" -r 145 "Woo hoo!" -o "$DIR/woo_hoo.m4a"
echo "  ✅ woo_hoo"

# "This is ___" phrases
for word in apple banana milk cookie water juice mama dada baby love hug kiss dog cat fish bird bear bunny red blue green yellow orange purple hi bye yes no please more; do
    NICE="$(echo $word | sed 's/^./\U&/')"
    say -v "$VOICE" -r 150 "This is ${NICE}!" -o "$DIR/thisis_${word}.m4a"
    echo "  ✅ thisis_$word"
done

echo ""
echo "🎉 All done! $(ls *.m4a | wc -l | tr -d ' ') audio files recorded with $VOICE!"

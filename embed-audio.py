import re

with open('audio-data.js', 'r') as f:
    audio_js = f.read()

with open('index.html', 'r') as f:
    html = f.read()

old = '    <!-- Embedded audio data (Shelley voice - sounds natural!) -->\n    <script src="audio-data.js"></script>'
new = '    <!-- Embedded audio data (Shelley voice - sounds natural!) -->\n    <script>\n' + audio_js + '\n    </script>'

html = html.replace(old, new)

with open('index.html', 'w') as f:
    f.write(html)

print('Done! Audio embedded inline.')

import re

with open('index.html', 'r') as f:
    html = f.read()
with open('audio-data.js', 'r') as f:
    new_audio = f.read()

old_pattern = r'<!-- Embedded audio data \(Shelley voice.*?\) -->\s*<script>\n.*?\n\s*</script>'
new_block = '<!-- Embedded audio data (Samantha voice - warm & friendly!) -->\n    <script>\n' + new_audio + '\n    </script>'

html_new = re.sub(old_pattern, new_block, html, flags=re.DOTALL)

if len(html_new) != len(html):
    with open('index.html', 'w') as f:
        f.write(html_new)
    print(f'Done! Old: {len(html)} chars -> New: {len(html_new)} chars')
else:
    print('No replacement made')

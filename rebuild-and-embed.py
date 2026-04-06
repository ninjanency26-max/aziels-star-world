#!/usr/bin/env python3
"""Rebuild audio-data.js from .m4a files, then swap into index.html"""
import base64, os, re, glob

audio_dir = os.path.expanduser("~/Desktop/apps-and-games/aziels-star-world/audio")
html_file = os.path.expanduser("~/Desktop/apps-and-games/aziels-star-world/index.html")

# Build new AUDIO_DATA entries
entries = {}
for f in sorted(glob.glob(os.path.join(audio_dir, "*.m4a"))):
    key = os.path.splitext(os.path.basename(f))[0]
    with open(f, "rb") as fh:
        b64 = base64.b64encode(fh.read()).decode("ascii")
    entries[key] = f"data:audio/mp4;base64,{b64}"

# Build JS block
lines = ["const AUDIO_DATA = {"]
keys = sorted(entries.keys())
for i, k in enumerate(keys):
    comma = "," if i < len(keys) - 1 else ""
    lines.append(f'  "{k}": "{entries[k]}"{comma}')
lines.append("};")
new_block = "\n".join(lines)

# Read HTML
with open(html_file, "r") as fh:
    html = fh.read()

# Replace the AUDIO_DATA block
pattern = r'const AUDIO_DATA = \{.*?\};'
match = re.search(pattern, html, re.DOTALL)
if not match:
    print("ERROR: Could not find AUDIO_DATA block in index.html!")
    exit(1)

old_len = len(match.group(0))
new_html = html[:match.start()] + new_block + html[match.end():]

print(f"Replaced AUDIO_DATA block:")
print(f"  Old block: {old_len:,} chars")
print(f"  New block: {len(new_block):,} chars")
print(f"  Keys: {len(entries)}")
print(f"  File: {len(html):,} -> {len(new_html):,} chars")

with open(html_file, "w") as fh:
    fh.write(new_html)

print("Done! index.html updated with new slower audio.")

#!/usr/bin/env python
import os
import markdown
import yaml
import re

POSTS_DIR = "posts"
OUTPUT_DIR = "output"

os.makedirs(OUTPUT_DIR, exist_ok=True)

# Generate a global CSS file
css_content = """body {
    font-family: sans-serif;
    max-width: 50%;
    margin: auto;
    padding: 20px;
}

ul {
    list-style-type: none; /* Removes bullet points */
    padding: 0; /* Removes default padding */
}

li {
    margin-bottom: 10px; /* Adds spacing between list items */
}

pre {
    white-space: pre-wrap; /* Wraps text instead of overflowing */
    word-wrap: break-word; /* Ensures long words don't break layout */
    overflow-x: auto; /* Allows horizontal scrolling if necessary */
}
"""
with open(os.path.join(OUTPUT_DIR, "styles.css"), "w", encoding="utf-8") as css_file:
    css_file.write(css_content)

post_entries = []

for root, _, files in os.walk(POSTS_DIR):
    for filename in files:
        if filename.endswith(".md"):
            filepath = os.path.join(root, filename)
            with open(filepath, "r", encoding="utf-8") as md_file:
                md_content = md_file.read()

            # Extract YAML front matter
            metadata_match = re.match(r"^---\n(.*?)\n---\n", md_content, re.DOTALL)
            metadata = {}
            if metadata_match:
                metadata = yaml.safe_load(metadata_match.group(1))
                md_content = md_content[len(metadata_match.group(0)):]  # Remove YAML block

            if metadata.get("draft", False):  # Default to False if not specified
                continue
            
            title = metadata.get("title", "Untitled Post")
            date = metadata.get("date", "Unknown Date")

            # Convert Markdown to HTML (basic)
            html_content = markdown.markdown(md_content, extensions=["fenced_code", "tables"])

            # Save HTML file
            html_filename = filename.replace(".md", ".html")
            html_path = os.path.join(OUTPUT_DIR, html_filename)
            with open(html_path, "w", encoding="utf-8") as html_file:
                html_file.write(f"""<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{title}</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>{title}</h1>
    <p>{date}</p>
    {html_content}
</body>
</html>""")

            post_entries.append((date, title, html_filename))

# Sort posts by date (newest first)
post_entries.sort(reverse=True, key=lambda x: x[0])

# Generate index.html
index_content = """<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>bryce thomsen</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>bryce thomsen</h1>
    <ul>
"""

for date, title, html_filename in post_entries:
    index_content += f'        <li><a href="{html_filename}">{title}</a> - {date}</li>\n'

index_content += """    </ul>
</body>
</html>
"""

with open(os.path.join(OUTPUT_DIR, "index.html"), "w", encoding="utf-8") as index_file:
    index_file.write(index_content)

print("Blog generated! Open output/index.html to view it.")

import re

def parse_bullets(lines):
    stack = []  # Stack to manage nested levels
    html_lines = []

    for i, line in enumerate(lines):
        # Skip empty lines
        if not line.strip() or i < 13:
            html_lines.append(line)
            continue
        # Count leading tabs for depth
        stripped = line.lstrip('\t')
        depth = len(line) - len(stripped)
        if len(lines) > i + 1:
            next_line = lines[i + 1]
        else:
            next_line = ""
        next_line_stripped = next_line.lstrip('\t')
        next_line_depth = len(next_line) - len(next_line_stripped)
        # Close deeper levels if needed
        while stack and stack[-1] >= depth:
            html_lines.append('\t' * stack[-1] + "</details>")
            stack.pop()
        # Check if it's a bullet point
        if stripped.startswith("* "):
            content = stripped[2:].strip()
            if next_line_stripped.startswith("* ") and next_line_depth > depth:
                # Open a new toggle
                html_lines.append('\t' * depth + f'<details>')
                html_lines.append('\t' * depth + f'<summary style="margin-left: {depth}em;">{content}</summary>')
                stack.append(depth)
            else:
                # Treat as paragraph content inside current toggle
                html_lines.append('\t'*depth + f'<p style="margin-left: {depth}em;">{content}</p>')
        else:
            html_lines.append(line)

    # Close any remaining open tags
    while stack:
        html_lines.append('\t' * stack[-1] + "</details>")
        stack.pop()

    return html_lines

def convert_markdown_images_line(line):
    # Handles both empty and non-empty alt text
    return re.sub(r'!\[([^\]]*)\]\(([^)]+)\)', r'<img src="\2" alt="\1">', line)

def convert_markdown_links_line(line):
    # Convert [Text](url) → <a href="url">Text</a>
    return re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'<a href="\2">\1</a>', line)

def convert_unparsed_markdown_between_toggles(lines): # Because we use HTML to create toggles, the inside content won't be parsed as markdown, thus we parse and convert that markdown manually.
    converted = []
    for line in lines:
        line = convert_markdown_images_line(line)
        line = convert_markdown_links_line(line)
        converted.append(line)
    return converted

def transform_markdown_to_html_toggles(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    converted_lines = convert_unparsed_markdown_between_toggles(lines)
    html_lines = parse_bullets(converted_lines)
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(html_lines))

if __name__ == "__main__":
    transform_markdown_to_html_toggles("output/md/index.md")

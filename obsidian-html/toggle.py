def parse_bullets(lines):
    stack = []  # Stack to manage nested levels
    html_lines = []

    for i, line in enumerate(lines):
        # Skip empty lines
        if not line.strip() or i < 11:
            html_lines.append(f"<p>{line.strip()}</p>")
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
        # Check if it's a bullet point
        if stripped.startswith("* "):
            content = stripped[2:].strip()
            # Close deeper levels if needed
            while stack and stack[-1] >= depth:
                html_lines.append('\t' * stack[-1] + "</details>")
                stack.pop()
            if next_line_stripped.startswith("* ") and next_line_depth > depth:
                # Open a new toggle
                html_lines.append('\t' * depth + f'<details>')
                html_lines.append('\t' * depth + f'<summary style="margin-left: {depth}em;">{content}</summary>')
                stack.append(depth)
            else:
                # Treat as paragraph content inside current toggle
                html_lines.append('\t'*depth + f'<p style="margin-left: {depth}em;">{content}</p>')
        else:
            html_lines.append(f"<p>{line.strip()}</p>")

    # Close any remaining open tags
    while stack:
        html_lines.append('\t' * stack[-1] + "</details>")
        stack.pop()

    return html_lines

def transform_markdown_to_html_toggles(filename):
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    html_lines = parse_bullets(lines)
    with open(filename, 'w', encoding='utf-8') as f:
        f.write('\n'.join(html_lines))

if __name__ == "__main__":
    transform_markdown_to_html_toggles("output/md/index.md")

# SLE Release Notes Assistant Prompt

This directory contains a custom VS Code Copilot prompt tailored for the SystemLink Enterprise repository.

## Current Status
- ✅ **Active**: The prompt is available in VS Code chat (type `/` to see it)
- 🔒 **Private**: Currently gitignored and not shared with the team
- 🌿 **Portable**: Works across all branches since it's in `.github/prompts/`

## Usage
1. Open VS Code chat
2. Type `/` to see available prompts
3. Select "SLE Release Notes Assistant" from the list
4. Ask questions about release notes, configuration, installation, etc.

## Making It Team-Wide (When Ready)
To share this prompt with your team:

1. **Remove from gitignore**:
   ```bash
   # Edit .gitignore and remove or comment out:
   # .github/prompts/
   ```

2. **Commit and push**:
   ```bash
   git add .github/prompts/
   git commit -m "Add SLE Release Notes Assistant prompt for team use"
   git push
   ```

3. **Team members will need to**:
   - Pull the changes
   - Reload VS Code or run "Developer: Reload Window"

## Customization
Edit `sle-release-notes-assistant.prompt.md` to:
- Add new expertise areas
- Update repository knowledge
- Modify the prompt behavior
- Add specific templates or examples

The prompt automatically stays in sync across branches since it's in the `.github/` directory.
---
name: "Release Notes Editing Assistant"
description: "Automatic formatting and style guidance when editing SystemLink Enterprise release notes"
applyTo: "release-notes/**/README.md"
---

You are providing editing assistance for SystemLink Enterprise release notes. Apply these standards automatically as the user edits:

## Formatting Standards
- **Service references**: Use `servicename:version.number` format with specific versions
- **API endpoints**: Format as `/api/endpoint` in code blocks
- **Configuration keys**: Use `config.key.path` in code blocks  
- **Service names**: Use plain text (SystemsManagementService, Elasticsearch)
- **UI elements**: Use **bold** for on-screen elements (**Apply on all resources**)
- **Service references in text**: Single words (userservices, not "user services")

## Content Guidelines
- Use active voice: "Added support for..." not "Support was added for..."
- Explain user impact: What changed and why it matters to administrators
- Include documentation links for new features when available
- For breaking changes, provide configuration guidance
- Maintain professional, technical tone appropriate for IT administrators

## Quality Reminders
- After editing, suggest running `npm run lint-changed:fix`
- Encourage verification of all links
- Remind to use specific version numbers (avoid `.x`)
- Suggest comparing against well-edited past releases for consistency

## Template Links
When Helm configuration paths are mentioned, suggest linking to specific lines in `getting-started/templates/` files when they exist.

Provide suggestions proactively but don't be overly intrusive. Focus on maintaining consistency with established quality standards.
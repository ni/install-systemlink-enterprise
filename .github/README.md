# SystemLink Enterprise Release Notes AI Tools

This directory contains AI-powered tools to help with SystemLink Enterprise
release notes authoring and quality assurance.

## Available Tools

### 1. Release Notes Authoring Workflow (Skill)

**Command**: `/release-notes-authoring`  
**Use Case**: Complete monthly release notes creation from scratch  
**Best For**: Monthly release authors who need step-by-step guidance

**What it provides:**

- Multi-step workflow from source gathering to publication
- Interactive prompts for collecting information from specific sources:
  - SharePoint: Breaking changes Excel file in SLE Development folder
  - AzDO: Documentation Reviews repo PRs and DevCentral build pipelines
  - Contacts: Bug lists and SBOM files from designated team members
- Templates and examples for consistent structure
- Quality standards and formatting guidance
- Bundled resources (templates, examples, checklists)

**When to use:** Starting a new monthly release notes document

### 2. Automatic Editing Assistant (Instructions)

**Activation**: Automatic when editing monthly release notes in
`release-notes/YYYY-MM/README.md`  
**Use Case**: Real-time guidance during editing  
**Best For**: Maintaining standards while actively writing/editing

**What it provides:**

- Automatic formatting suggestions
- Style and consistency reminders
- Links to configuration templates when applicable
- Quality checkpoint reminders

**When to use:** Continuously active during release notes editing

## Recommended Workflow

### For New Release Notes:

1. **Start with the Authoring Skill**: `/release-notes-authoring`
   - Guides you through complete workflow
   - Provides specific URLs and contacts for source materials:
     - SharePoint Excel file for breaking changes
     - Documentation Reviews repo for new features
     - DevCentral pipelines for container lists
     - Team contacts for bugs and SBOM files
   - Uses copy/paste approach to avoid credential sharing
   - Provides templates and structure
2. **Editing Support**: Instructions activate automatically
   - Real-time formatting assistance
   - Consistency reminders during editing

## File Structure

```
.github/
├── skills/
│   └── release-notes-authoring/
│       ├── SKILL.md                    # Main workflow
│       ├── templates/
│       │   ├── release-notes-template.md
│       │   └── section-examples.md
│       └── references/
│           ├── 2024-05-example.md
│           └── formatting-checklist.md
└── instructions/
   └── release-notes.instructions.md   # Auto-editing assistance
```

## Quality Standards

All tools enforce consistent standards for:

- Release title formatting (`# SystemLink Enterprise YYYY-MM Release Notes`)
- Service name formatting (`servicename:version.number`)
- API endpoint formatting (`` `/api/endpoint` ``)
- UI element formatting (**Bold text**)
- Active voice usage
- User impact explanations
- Template configuration links
- Professional technical tone

## Getting Started

1. **New monthly release**: Type `/release-notes-authoring` and specify your
   version
2. **Editing help**: Open a monthly release notes file under
   `release-notes/YYYY-MM/` and assistance activates automatically

These tools work together to ensure consistent, high-quality release notes that
meet the established professional standards across all monthly releases.

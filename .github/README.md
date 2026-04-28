# SystemLink Enterprise Release Notes AI Tools

This directory contains AI-powered tools to help with SystemLink Enterprise release notes authoring and quality assurance.

## Available Tools

### 1. Release Notes Authoring Workflow (Skill)
**Command**: `/release-notes-authoring`  
**Use Case**: Complete monthly release notes creation from scratch  
**Best For**: Monthly release authors who need step-by-step guidance

**What it provides:**
- Multi-step workflow from source gathering to publication
- Interactive prompts for collecting information from SharePoint, AzDO, etc.
- Templates and examples for consistent structure
- Quality standards and formatting guidance
- Bundled resources (templates, examples, checklists)

**When to use:** Starting a new monthly release notes document

### 2. Release Notes Quality Reviewer (Prompt)
**Command**: `/SLE Release Notes Reviewer`  
**Use Case**: Quality assurance and standardization of existing content  
**Best For**: Reviewing contributed content to ensure it meets established standards

**What it provides:**
- Systematic review against quality standards
- Specific, actionable recommendations
- Comparison with well-edited past releases
- Formatting and style corrections
- Technical accuracy verification

**When to use:** Reviewing draft release notes before publication

### 3. Automatic Editing Assistant (Instructions)
**Activation**: Automatic when editing `release-notes/**/README.md` files  
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
   - Helps gather and organize source materials
   - Provides templates and structure
   
2. **Editing Support**: Instructions activate automatically
   - Real-time formatting assistance
   - Consistency reminders during editing

3. **Final Review**: `/SLE Release Notes Reviewer`
   - Comprehensive quality check
   - Verification against standards
   - Final polish before publication

### For Reviewing Existing Content:
1. **Use the Quality Reviewer**: `/SLE Release Notes Reviewer`
   - Direct quality assessment
   - Specific improvement recommendations
   - Standards compliance verification

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
├── instructions/
│   └── release-notes.instructions.md   # Auto-editing assistance
└── prompts/
    └── sle-release-notes-reviewer.prompt.md  # Quality reviewer
```

## Quality Standards

All tools enforce consistent standards for:
- Service name formatting (`servicename:version.number`)
- API endpoint formatting (`` `/api/endpoint` ``)
- UI element formatting (**Bold text**)
- Active voice usage
- User impact explanations
- Template configuration links
- Professional technical tone

## Getting Started

1. **New monthly release**: Type `/release-notes-authoring` and specify your version
2. **Review existing content**: Type `/SLE Release Notes Reviewer` and reference the file
3. **Editing help**: Open any release notes file - assistance activates automatically

These tools work together to ensure consistent, high-quality release notes that meet the established professional standards across all monthly releases.
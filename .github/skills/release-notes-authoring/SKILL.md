---
name: release-notes-authoring
description: "Multi-step workflow for authoring SystemLink Enterprise monthly release notes with templates, examples, and quality standards"
---

# SystemLink Enterprise Release Notes Authoring Workflow

This skill guides you through the complete monthly release notes authoring process, from gathering source material to producing publication-ready documentation that meets established quality standards.

## Workflow Overview

1. **Gather Source Materials** - Collect information from various sources
2. **Structure Content** - Organize information using established patterns 
3. **Format and Style** - Apply consistent formatting and editorial standards
4. **Review and Validate** - Ensure quality and completeness

## Step 1: Gather Source Materials

### Information Sources
I'll help you identify and organize content from your typical sources:
- SharePoint documentation
- Azure DevOps (AzDO) pipeline information
- New features PR in AzDO
- Service team contributions

**Process:**
1. Ask for locations of source materials
2. Guide you through extracting key information
3. Help categorize content by section type
4. Identify any missing required information

**Questions I'll ask:**
- What is the release version (e.g., 2026-04)?
- Where are the SharePoint docs located?
- What AzDO pipeline/PR contains the feature information?
- Are there any breaking changes to document?
- What services have version updates?

## Step 2: Structure Content

Using established patterns from successful releases, I'll help you organize content into:

### Required Sections (in order):
1. **Main title**: `# SystemLink Enterprise [version] Release Notes`
2. **Opening paragraph**: Standard language about release publication
3. **New Features and Behavior changes**: Core content with bullet points
4. **Helm Chart Breaking Changes**: If applicable
5. **Upgrade Considerations**: If applicable
6. **Additional sections**: Bug fixes, SBOM, versions as needed

### Content Organization:
- Group related changes together
- Order by impact/importance (major to minor)
- Ensure each change explains WHAT and WHY
- Include documentation links where available
- Use consistent bullet point structure

## Step 3: Format and Style

### Technical Formatting Standards:
- **Service references**: `servicename:version.number`
- **API endpoints**: `/niserviceregistry/v1` (code blocks)
- **Configuration keys**: `systems.secrets.elasticsearch.password` (code blocks)
- **Service names**: Plain text (SystemsManagementService, Elasticsearch)
- **UI elements**: **Bold** (**Apply on all resources**, **Security** application)
- **Helm configuration links**: Link to specific lines in `getting-started/templates/` when available

### Editorial Standards:
- **Active voice**: "Added support for..." not "Support was added for..."
- **Professional tone**: Technical, factual, appropriate for IT administrators
- **Consistent terminology**: Single words for service names (userservices not "user services")
- **User impact**: Explain what changes mean for administrators
- **Completeness**: Include configuration examples for breaking changes

## Step 4: Review and Validate

### Quality Checklist:
- [ ] Title format matches standard pattern
- [ ] All sections in correct order
- [ ] Service versions are specific (not `.x`)
- [ ] API endpoints in code blocks
- [ ] Service names in plain text
- [ ] UI elements in bold
- [ ] Links verified and properly formatted
- [ ] Active voice throughout
- [ ] User impact clearly explained
- [ ] Breaking changes include configuration guidance

### Final Steps:
1. Run `npm run lint-changed:fix` to ensure formatting compliance
2. Review against recent well-edited releases (see references/)
3. Verify all links are accessible
4. Confirm technical accuracy with service teams if needed

## Available Resources

### Templates:
- `templates/release-notes-template.md` - Basic structure template
- `templates/section-examples.md` - Examples of well-written sections

### References:
- `references/2024-05-example.md` - Complete example of well-edited release
- `references/formatting-checklist.md` - Quick formatting reference

## Usage Notes

- This workflow is designed for monthly release authors who may not be familiar with the established patterns
- Each step includes prompts to gather necessary information
- Templates and examples ensure consistency across different authors
- Quality standards maintain the professional documentation standard established in previous releases

**Start Command**: Simply say "Help me author release notes for [version]" and I'll guide you through the complete workflow.
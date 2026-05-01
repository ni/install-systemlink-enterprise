---
name: release-notes-authoring
description:
  "Author or finalize SystemLink Enterprise monthly release notes from source
  materials through final review. Use when users ask to create, draft, write,
  assemble, or polish monthly release notes, especially when the work involves
  gathering source inputs, structuring sections, or enforcing repo style."
---

# SystemLink Enterprise Release Notes Authoring Workflow

This skill guides you through the complete monthly release notes authoring
process, from gathering source material to producing publication-ready
documentation that meets established quality standards.

## Workflow Overview

1. **Gather Source Materials** - Collect information from various sources
2. **Structure Content** - Organize information using established patterns
3. **Format and Style** - Apply consistent formatting and editorial standards
4. **Review and Validate** - Ensure quality and completeness

## Step 1: Gather Source Materials

### Information Sources

I'll guide you to collect specific content from these standardized sources. For
each source, I'll ask you to copy and paste the relevant material here rather
than sharing credentials or accessing systems directly.

#### Required Source Materials:

**1. Helm Chart Breaking Changes and Behavior Changes**

- **Location**: SharePoint Excel file in SLE Development folder
- **URL**:
  https://emerson.sharepoint.com/sites/ASWSystemLink/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FASWSystemLink%2FShared%20Documents%2FSLE%20Development&viewid=1112dd39%2D5a45%2D4b2d%2D8b73%2D4180eb299d43
- **What to look for**: Breaking changes, behavior modifications, service
  updates
- **Action needed**: Copy relevant rows/content from the Excel file and paste
  here

**2. New Features Documentation**

- **Location**: PR in the Documentation Reviews repository
- **URL**: https://dev.azure.com/ni/Users/_git/Documentation%20Reviews
- **What to look for**: New feature descriptions, user-facing changes
- **Action needed**: Find the PR for this release and copy the feature content.
  Ensure links to documentation are included if available.

**3. Container Version Lists and Helm Chart Versions**

- **Location**: Output from these build pipelines:
  - SystemLink Helm Build:
    https://dev.azure.com/ni/DevCentral/_build?definitionId=27829
  - SystemLink Admin Helm Build:
    https://dev.azure.com/ni/DevCentral/_build?definitionId=8513
  - SystemLink Elasticsearch Helm Build:
    https://dev.azure.com/ni/DevCentral/_build?definitionId=7783&_a=summary
- **What to look for**:
  - Helm chart versions (from pipeline run titles)
  - Complete container lists with version numbers
- **Action needed**:
  - Go to the last run from your release branch of each pipeline
  - Include the version of the last built Helm chart (found in the title of the
    pipeline run)
  - Find the step "Generate artifact lists" under the "Verify artifact
    signatures" job
  - Copy the list of "Found docker images" and remove the path prefix
  - Include both NI artifacts and third party artifacts in the release notes

**4. Customer-Facing Bugs**

- **Contact**: Ciprian Iakab
- **Action needed**: Request the bug list excel document from Ciprian and
  include it in your branch (links will be added to final document)

**5. SBOMs and Notice Files**

- **Contact**: Ciprian Iakab
- **Action needed**: Request these files from Ciprian (links will be added to
  final document)

### Gathering Process:

1. **Initial Setup**: Confirm release version (e.g., 2026-05)
2. **Source Collection**: I'll guide you through each source systematically
3. **Content Review**: Together we'll review what you've gathered
4. **Gap Analysis**: Identify any missing information before proceeding

## Step 2: Structure Content

Using established patterns from successful releases, I'll help you organize
content into:

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
- **UI elements**: **Bold** (**Apply on all resources**, **Security**
  application)
- **Helm configuration links**: Link to specific lines in
  `getting-started/templates/` when available
- **Ordered lists**: Use `1.` for all items (not `1.`, `2.`, `3.`) to minimize
  diff noise when reordering or adding items

### Breaking Changes Format:

- Start with service name and version: `servicename:version.number`
- Use bullet points for each breaking change under the service
- Use nested bullets for sub-items and details
- Include configuration links with standard text: "View this service
  configuration"
- Provide clear administrative action required
- Group related changes under the same service heading

**Example format:**

```markdown
- `dataframeservice:1.9.38`, `dremio-ee:24.1.2`
  - Added support for configuring custom CA certificates.
    - [View this service configuration](link-to-config)
  - This may conflict with existing configurations.
  - When setting new values, you must also remove deprecated configurations.
```

### Editorial Standards:

- Use active voice: "Added support for..." not "Support was added for..."
- Maintain professional tone: Technical, factual, appropriate for IT
  administrators
- Use consistent terminology: Single words for service names (userservices not
  "user services")
- Explain user impact: What changes mean for administrators
- Include configuration examples for breaking changes
- Avoid bolded list items: Use plain text for list content, not **Bold Item**:
  description format
- Write complete sentences in list items rather than fragmented phrases

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

- This workflow is designed for monthly release authors who may not be familiar
  with the established patterns
- Each step includes prompts to gather necessary information
- Templates and examples ensure consistency across different authors
- Quality standards maintain the professional documentation standard established
  in previous releases

**Start Command**: Simply say "Help me author release notes for [version]" and
I'll guide you through the complete workflow.

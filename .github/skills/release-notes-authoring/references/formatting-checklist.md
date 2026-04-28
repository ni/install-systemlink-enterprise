# Release Notes Formatting Checklist

## Structure Verification
- [ ] Title: `# SystemLink Enterprise [version] Release Notes` (check current standard for "release" inclusion)
- [ ] Opening paragraph with standard language about publication and credentials
- [ ] Section order: New Features → Breaking Changes → Upgrade Considerations → Bugs/SBOM/Versions

## Technical Formatting
- [ ] Service references: `servicename:version.number` (specific versions, no `.x`)
- [ ] API endpoints: `/api/endpoint` (in code blocks)
- [ ] Configuration keys: `config.key.path` (in code blocks)
- [ ] Service names: Plain text (SystemsManagementService, Elasticsearch)
- [ ] UI elements: **Bold** (**Apply on all resources**, **Security** application)
- [ ] Service names in text: Single words (userservices, not "user services")

## Content Quality
- [ ] Each feature explains WHAT changed and WHY it matters
- [ ] Breaking changes include configuration guidance
- [ ] User impact clearly described for technical changes
- [ ] Documentation links included where available
- [ ] Active voice throughout ("Added support for..." not "Support was added for...")

## Links and References
- [ ] All documentation links verified and accessible
- [ ] Helm configuration links point to specific lines in `getting-started/templates/` when available
- [ ] Link format: `[descriptive text](URL)`
- [ ] Bug fix links point to correct branch/version

## Final Quality Checks
- [ ] No marketing language or promotional tone
- [ ] Consistent terminology throughout
- [ ] Appropriate technical detail for IT administrator audience
- [ ] Parallel structure in bullet points and lists
- [ ] Version numbers match between sections

## Required Actions
- [ ] Run `npm run lint-changed:fix` after editing
- [ ] Verify against recent well-edited releases
- [ ] Confirm technical accuracy with service teams if needed
- [ ] Test all links for accessibility

## Common Mistakes to Avoid
- ❌ Using `.x` instead of specific version numbers
- ❌ Forgetting code blocks for API endpoints
- ❌ Using code blocks for service names in plain text
- ❌ Passive voice constructions
- ❌ Missing user impact explanations
- ❌ Inconsistent service name formatting
- ❌ Missing documentation links for new features
- ❌ Breaking changes without configuration guidance
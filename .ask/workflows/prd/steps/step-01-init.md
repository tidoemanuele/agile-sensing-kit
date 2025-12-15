---
name: 'step-01-init'
description: 'Initialize the PRD workflow by detecting continuation state and setting up the document'
workflow_path: '{project-root}/.ask/workflows/prd'
nextStepFile: '{workflow_path}/steps/step-02-discovery.md'
outputFile: '{output_folder}/prd.md'
prdTemplate: '{workflow_path}/prd-template.md'
---

# Step 1: Workflow Initialization

**Progress: Step 1 of 11** - Next: Project Discovery

## STEP GOAL

Initialize the PRD workflow by detecting continuation state, discovering input documents, and setting up the document structure.

## MANDATORY RULES

- 🛑 NEVER generate content without user input
- 📖 Read complete step file before action
- 📋 YOU ARE A FACILITATOR, not a content generator
- 🎯 Focus only on initialization - no content yet

---

## EXECUTION SEQUENCE

### 1. Check for Existing Workflow State

Check if output document exists at `{outputFile}`:
- If exists with `stepsCompleted` → load continuation step
- If not exists → fresh workflow setup

### 2. Fresh Workflow Setup

#### A. Input Document Discovery

Discover context documents:

**Product Brief:**
- Check: `{output_folder}/analysis/*brief*.md`
- Fallback: `{output_folder}/*brief*.md`
- Track count as `briefCount`

**Research Documents:**
- Check: `{output_folder}/analysis/research/*research*.md`
- Fallback: `{output_folder}/*research*.md`
- Track count as `researchCount`

**Project Documentation (Brownfield):**
- Check: `{output_folder}/index.md`
- Load to understand existing project context
- Track count as `projectDocsCount`

#### B. Create Initial Document

Copy template to `{outputFile}` with frontmatter:

```yaml
---
stepsCompleted: []
inputDocuments: []
documentCounts:
  briefs: {{briefCount}}
  research: {{researchCount}}
  projectDocs: {{projectDocsCount}}
workflowType: 'prd'
project_name: '{{project_name}}'
user_name: '{{user_name}}'
date: '{{date}}'
---
```

#### C. Present Results

"Welcome {{user_name}}! I've set up your PRD workspace for {{project_name}}.

**Document Setup:**
- Created: `{outputFile}` from template
- Initialized workflow tracking

**Input Documents Discovered:**
- Product briefs: {{briefCount}} files
- Research: {{researchCount}} files
- Project docs: {{projectDocsCount}} files

{if projectDocsCount > 0}
📋 **Note:** This is a **brownfield project**. Your existing documentation has been loaded.
{/if}

Do you have other documents to include, or shall we continue?"

### 3. Present Menu

"[C] Continue - Move to Project Discovery (Step 2 of 11)"

#### Menu Handling:
- IF C: Update frontmatter with `stepsCompleted: [1]`, load `{nextStepFile}`
- IF user provides files: Load them, update counts, redisplay
- IF questions: Answer and redisplay menu

---

## SUCCESS CRITERIA

✅ Existing workflow detected and handled
✅ Fresh workflow initialized with template
✅ Input documents discovered and tracked
✅ User informed of brownfield vs greenfield status
✅ Menu presented and user input awaited
✅ Frontmatter updated before proceeding

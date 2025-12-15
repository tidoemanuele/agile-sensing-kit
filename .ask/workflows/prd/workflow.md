---
name: create-prd
description: Creates comprehensive PRDs through collaborative step-by-step discovery
main_config: '{project-root}/.ask/core/config.yaml'
---

# PRD Workflow

**Goal:** Create comprehensive Product Requirements Documents through collaborative step-by-step discovery.

**Your Role:** You are a product-focused PM facilitator collaborating with an expert peer. This is a partnership - you bring structured thinking, they bring domain expertise.

---

## WORKFLOW ARCHITECTURE

This uses **step-file architecture** for disciplined execution:

### Core Principles

- **Micro-file Design**: Each step is self-contained
- **Just-In-Time Loading**: Only current step in memory
- **Sequential Enforcement**: No skipping or optimization
- **State Tracking**: Progress in frontmatter `stepsCompleted`
- **Append-Only Building**: Build documents incrementally

### Step Processing Rules

1. **READ COMPLETELY**: Read entire step file before action
2. **FOLLOW SEQUENCE**: Execute numbered sections in order
3. **WAIT FOR INPUT**: Halt at menus for user selection
4. **CHECK CONTINUATION**: Only proceed when user selects 'C'
5. **SAVE STATE**: Update frontmatter before loading next step
6. **LOAD NEXT**: When directed, load and execute next step

### Critical Rules (NO EXCEPTIONS)

- 🛑 **NEVER** load multiple step files simultaneously
- 📖 **ALWAYS** read entire step file before execution
- 🚫 **NEVER** skip steps or optimize the sequence
- 💾 **ALWAYS** update frontmatter after completing steps
- ⏸️ **ALWAYS** halt at menus and wait for user input

---

## WORKFLOW STEPS

| Step | Name | Purpose |
|------|------|---------|
| 1 | Init | Load config, detect existing workflow, setup document |
| 2 | Discovery | Project & domain discovery, classification |
| 3 | Success | Define success criteria and KPIs |
| 4 | Journeys | Map user journeys and personas |
| 5 | Domain | Domain analysis and constraints |
| 6 | Innovation | Identify innovation opportunities |
| 7 | Project Type | Classify project type |
| 8 | Scoping | Define scope boundaries |
| 9 | Functional | Functional requirements |
| 10 | Non-Functional | Non-functional requirements |
| 11 | Complete | Finalization and review |

---

## INITIALIZATION SEQUENCE

### 1. Configuration Loading

Load config from `{main_config}` and resolve:

- `project_name`, `output_folder`, `user_name`
- `communication_language`, `document_output_language`
- `date` as system-generated current datetime

### 2. First Step Execution

Load and execute `steps/step-01-init.md` to begin the workflow.

---

## COLLABORATION MENUS (A/P/C)

Most steps present choices:

- **A (Advanced Elicitation)**: Deeper analysis techniques
- **P (Party Mode)**: Bring multiple perspectives
- **C (Continue)**: Save content and proceed

---

## OUTPUT

Creates `{output_folder}/prd.md` with:

```yaml
---
stepsCompleted: [1, 2, 3...]
workflowType: 'prd'
project_name: '{{project_name}}'
user_name: '{{user_name}}'
date: '{{date}}'
---
```

---

## WHAT vs HOW DISCIPLINE

**You define the WHAT, not the HOW.**

Your PRD must focus on:
- **WHAT** the feature achieves
- **WHAT** problems it solves
- **WHAT** success looks like
- **WHAT** constraints exist

**NEVER include:**
- ❌ Code snippets or algorithms
- ❌ Specific technology choices
- ❌ Architecture diagrams
- ❌ API contracts or schemas
- ❌ Implementation details

**Examples:**

✅ **Good:** "The system must support real-time collaboration for up to 50 concurrent users with updates visible within 2 seconds."

❌ **Bad:** "Use SignalR hubs with WebSocket connections and implement backpressure handling."

# Getting Started with Spec2Cloud

Welcome! This guide will teach you how to use AI agents to build production-ready applications. Whether you're new to AI-assisted development or an experienced developer, this tutorial will help you understand the new way of working.

## What is Spec2Cloud?

Spec2Cloud is a **team of AI agents** that work together to help you:
- Transform product ideas into working applications
- Document existing codebases
- Deploy to Azure with best practices

Think of it as having a virtual development team where each member has a specific expertise.

---

## Your AI Team

### Meet the Agents

| Agent | Role | When to Use |
|-------|------|-------------|
| **@ask** | Orchestrator | Start here! Routes your request to the right agent |
| **@pm** | Product Manager "John" | Creating requirements, PRDs, user stories |
| **@devlead** | Technical Lead | Reviewing technical feasibility |
| **@architect** | System Architect | Architecture decisions, ADRs |
| **@planner** | Task Planner | Breaking down work into tasks |
| **@dev** | Developer "Amelia" | Writing code with TDD |
| **@azure** | Cloud Specialist | Deploying to Azure |
| **@tech-analyst** | Reverse Engineer | Documenting existing code |
| **@modernizer** | Modernization Expert | Upgrading legacy systems |
| **@tea** | Test Engineer | Code review, test quality |

### How Agents Work Together

```
You describe what you want to build
         ↓
   @ask (orchestrator)
         ↓
   Routes to the right agent
         ↓
   Agent does the work
         ↓
   Hands off to next agent (or back to you)
```

---

## Two Ways to Work

### 1. Greenfield (Building Something New)

Start with an idea, end with deployed code:

```
/prd → /frd → /plan → /implement → /deploy
```

**Example Flow:**
1. **You:** "I want to build a quiz game about country flags"
2. **@pm** creates PRD with requirements
3. **@pm** breaks it into feature specs (FRDs)
4. **@planner** creates technical tasks
5. **@dev** implements the code
6. **@azure** deploys to Azure

### 2. Brownfield (Working with Existing Code)

Start with code, create documentation:

```
/rev-eng → /modernize → /plan → /deploy
```

**Example Flow:**
1. **You:** "Document this legacy Python app"
2. **@tech-analyst** analyzes and documents the code
3. **@modernizer** identifies upgrade opportunities
4. **@dev** implements improvements
5. **@azure** deploys the updated version

---

## Your First Project: Quiz Game

Let's build a simple quiz game together. This tutorial takes about 30 minutes.

### Step 1: Open GitHub Copilot Chat

1. Open VS Code
2. Press `Ctrl+Shift+I` (Windows/Linux) or `Cmd+Shift+I` (Mac)
3. The Copilot Chat panel opens

### Step 2: Start with the Orchestrator

Type in the chat:
```
@ask I want to build a quiz game where users guess countries from their flags.
It should track scores and have different difficulty levels.
```

The orchestrator will understand your request and either:
- Ask clarifying questions
- Hand off to the PM agent to create requirements

### Step 3: Create Your PRD

When ready, use the PRD command:
```
/prd
```

The PM agent will:
1. Ask you questions about your vision
2. Create `specs/prd.md` with your requirements
3. Define success criteria and user stories

**What you'll see in `specs/prd.md`:**
```markdown
# Product Requirements Document

## Purpose
A flag quiz game to test geography knowledge...

## User Stories
- As a player, I want to see a flag and guess the country...
- As a player, I want to track my high score...
```

### Step 4: Break Down Features

```
/frd
```

The PM agent creates individual feature specs in `specs/features/`:
- `quiz-gameplay.md`
- `scoring-system.md`
- `difficulty-levels.md`

### Step 5: Create Technical Plan

```
/plan
```

The planner agent:
1. Reads your PRD and FRDs
2. Creates tasks in `specs/tasks/`
3. Identifies dependencies
4. Creates architecture diagrams

### Step 6: Implement

```
/implement
```

The dev agent:
1. Follows TDD (Test-Driven Development)
2. Writes tests first
3. Implements code to pass tests
4. Refactors for quality

### Step 7: Deploy

```
/deploy
```

The Azure agent:
1. Analyzes your code
2. Creates Bicep infrastructure templates
3. Sets up CI/CD pipelines
4. Deploys to Azure

---

## Understanding Agent Handoffs

Agents can "hand off" to each other. You'll see buttons like:

```
[Create PRD (/prd)] [Review PRD for Technical Feasibility] [Break PRD into FRDs]
```

Click these buttons to move through the workflow, or type the commands manually.

### Party Mode

Some agents offer "Party Mode" - a multi-agent discussion where different perspectives come together:

```
[Party Mode]
```

This activates a collaborative session with multiple agents discussing your problem.

---

## Key Files and Folders

After installation, your project has:

```
your-project/
├── .github/
│   ├── agents/           # AI agent definitions
│   └── prompts/          # Workflow commands (/prd, /frd, etc.)
├── .ask/
│   ├── workflows/        # Step-by-step workflow guides
│   ├── knowledge/        # Best practices (TDD, testing)
│   └── templates/        # Project templates
├── specs/
│   ├── prd.md           # Product Requirements (created by /prd)
│   ├── features/        # Feature specs (created by /frd)
│   ├── tasks/           # Technical tasks (created by /plan)
│   ├── adr/             # Architecture decisions
│   └── docs/            # Generated documentation
├── project-context.md.template  # Copy & customize this!
└── GETTING-STARTED.md   # This file
```

---

## Setting Up Your Project Context

The agents work better when they understand your project.

### Step 1: Create project-context.md

```bash
cp project-context.md.template project-context.md
```

### Step 2: Fill In Your Details

```markdown
# Project Context

## Project Overview
**Project Name:** Flag Quiz Game
**Description:** Educational geography quiz game
**Tech Stack:** React, Node.js, Azure

## Architecture Decisions
| Layer | Technology | Rationale |
|-------|------------|-----------|
| Frontend | React | Modern UI, component-based |
| Backend | Node.js | JavaScript ecosystem |
| Database | Cosmos DB | Flexible schema |
| Hosting | Azure Static Web Apps | Easy deployment |

## Coding Standards
- Use TypeScript for type safety
- Follow React best practices
- 85% minimum test coverage
```

Agents reference this file as the "source of truth" for your project.

---

## Command Reference

### Greenfield Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `/prd` | @pm | Create Product Requirements Document |
| `/frd` | @pm | Create Feature Requirements Documents |
| `/plan` | @planner | Create technical task breakdown |
| `/implement` | @dev | Implement features with TDD |
| `/delegate` | @dev | Create GitHub issues for Copilot |
| `/deploy` | @azure | Deploy to Azure |
| `/adr` | @architect | Create Architecture Decision Record |

### Brownfield Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `/rev-eng` | @tech-analyst | Reverse engineer existing code |
| `/modernize` | @modernizer | Create modernization plan |

### Utility Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `/generate-agents` | @architect | Generate AGENTS.md standards |

---

## Tips for Success

### 1. Start with Clear Intent
Bad: "Make an app"
Good: "Build a quiz game where users guess countries from flags, with score tracking and 3 difficulty levels"

### 2. Let Agents Ask Questions
Don't try to specify everything upfront. The PM agent will ask clarifying questions to understand your needs.

### 3. Review Before Moving On
After each step, review the generated files:
- `specs/prd.md` - Does it capture your vision?
- `specs/features/*.md` - Are features well-defined?
- `specs/tasks/*.md` - Are tasks clear and testable?

### 4. Use Handoffs
Click the handoff buttons to flow naturally between agents. The workflow is designed to guide you.

### 5. Iterate
Documents are "living" - you can always go back and refine:
```
@pm Please update the PRD to add multiplayer support
```

---

## Troubleshooting

### Agents Not Showing
1. Reload VS Code: `Ctrl+Shift+P` → "Reload Window"
2. Ensure GitHub Copilot extension is installed
3. Check `.github/agents/` folder exists

### Commands Not Working
1. Ensure `.github/prompts/` folder exists
2. Type `/` in Copilot Chat to see available commands
3. Try the full command: `/prd.prompt.md`

### Missing Context
If agents seem confused about your project:
1. Create `project-context.md` from the template
2. Ensure `specs/prd.md` exists for technical agents

---

## Next Steps

1. **Try the tutorial** - Build the quiz game step by step
2. **Explore .ask/knowledge/** - Learn TDD and testing best practices
3. **Read WORKFLOW-REFERENCE.md** - Detailed command documentation
4. **Customize project-context.md** - Tailor agents to your project

---

## Getting Help

- **Stuck?** Ask `@ask` to explain what's happening
- **Wrong agent?** The orchestrator will redirect you
- **Need examples?** Check `.ask/workflows/` for step-by-step guides

---

**Happy building! Remember: The AI agents are here to help you, not replace you. You're still the decision-maker.**

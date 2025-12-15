# Spec2Cloud Workflow Reference

Complete reference for all agents, commands, and workflows.

---

## Table of Contents

1. [Agents](#agents)
2. [Commands](#commands)
3. [Workflows](#workflows)
4. [Output Files](#output-files)
5. [Advanced Features](#advanced-features)

---

## Agents

### @ask - Orchestrator

**Purpose:** Main entry point that routes requests to specialized agents.

**When to use:**
- Starting a new conversation
- Unsure which agent to use
- Need coordination between multiple agents

**Example:**
```
@ask I want to build a task management app with team collaboration
```

**Capabilities:**
- Intent analysis
- Agent routing
- Multi-agent coordination
- Progress tracking

---

### @pm - Product Manager "John"

**Purpose:** Creates product requirements and feature specifications.

**When to use:**
- Defining what to build
- Creating PRDs and FRDs
- Clarifying business requirements
- Defining acceptance criteria

**Commands:**
- `/prd` - Create Product Requirements Document
- `/frd` - Create Feature Requirements Documents

**Output files:**
- `specs/prd.md`
- `specs/features/*.md`

**Handoffs available:**
- Review PRD for Technical Feasibility → @devlead
- Break PRD into FRDs → @pm
- Generate ADRs → @architect
- Create Implementation Plan → @planner
- Party Mode → Multi-agent discussion

**Key principle:** Defines WHAT to build, never HOW.

---

### @devlead - Technical Lead

**Purpose:** Reviews requirements for technical feasibility.

**When to use:**
- Validating PRD/FRD completeness
- Identifying technical gaps
- Ensuring requirements are implementable

**Capabilities:**
- Technical feasibility review
- Gap identification
- Standards validation
- Simplicity advocacy

**Handoffs available:**
- Update PRD/FRDs → @pm
- Create ADRs → @architect
- Create Plan → @planner

---

### @architect - System Architect

**Purpose:** Makes and documents architecture decisions.

**When to use:**
- Key technology decisions
- System design patterns
- Creating ADRs
- Generating AGENTS.md

**Commands:**
- `/adr` - Create Architecture Decision Record
- `/generate-agents` - Generate AGENTS.md from standards

**Output files:**
- `specs/adr/*.md`
- `AGENTS.md`

**Handoffs available:**
- Validate with PM → @pm
- Create Plan → @planner
- Party Mode → Multi-agent discussion

---

### @planner - Task Planner

**Purpose:** Breaks down features into technical tasks.

**When to use:**
- Creating implementation plans
- Task breakdown
- Dependency identification
- Architecture diagrams

**Commands:**
- `/plan` - Create technical task breakdown

**Output files:**
- `specs/tasks/*.md`
- Mermaid diagrams (L0-L3)

**Key principle:** Plans but NEVER implements.

**Handoffs available:**
- Begin Implementation → @dev
- Request ADRs → @architect

---

### @dev - Developer "Amelia"

**Purpose:** Implements code using strict TDD discipline.

**When to use:**
- Writing application code
- Following TDD red-green-refactor
- Implementing tasks from plan

**Commands:**
- `/implement` - Implement features locally
- `/delegate` - Create GitHub issues for Copilot coding agent

**Key principles:**
- Story file is single source of truth
- Red-green-refactor cycle mandatory
- Never implement without mapped task
- All tests must pass before completion

**TDD Cycle:**
```
1. RED: Write failing test first
2. GREEN: Minimum code to pass
3. REFACTOR: Improve while green
4. Repeat
```

**Handoffs available:**
- Deploy to Azure → @azure
- Code Review → @tea
- Party Mode → Multi-agent discussion

---

### @azure - Azure Specialist

**Purpose:** Deploys applications to Azure with best practices.

**When to use:**
- Azure deployment
- Infrastructure as Code
- CI/CD pipeline creation

**Commands:**
- `/deploy` - Deploy to Azure

**Capabilities:**
- Codebase analysis for deployment needs
- Bicep template generation
- GitHub Actions workflows
- Azure Dev CLI (azd) integration

**Output files:**
- `infra/*.bicep`
- `.github/workflows/*.yml`

**Handoffs available:**
- Request Architecture Review → @architect
- Implementation Support → @dev

---

### @tech-analyst - Reverse Engineering Analyst

**Purpose:** Documents existing codebases.

**When to use:**
- Undocumented legacy code
- Pre-acquisition analysis
- Knowledge capture

**Commands:**
- `/rev-eng` - Reverse engineer codebase

**Key principles:**
- NEVER modifies code (read-only)
- Documents ONLY what exists
- Honest about gaps and issues
- Links tasks to actual code files

**Output files:**
- `specs/tasks/*.md`
- `specs/features/*.md`
- `specs/prd.md`

---

### @modernizer - Modernization Expert

**Purpose:** Plans upgrades for legacy systems.

**When to use:**
- Technical debt assessment
- Dependency upgrades
- Architecture modernization

**Commands:**
- `/modernize` - Create modernization plan

**Key principles:**
- NEVER modifies code (read-only)
- Evidence-based recommendations
- Honest about feasibility and risks

**Output files:**
- `specs/modernize/assessment/*.md`
- `specs/modernize/strategy/*.md`
- `specs/tasks/*.md`

---

### @tea - Test Engineer

**Purpose:** Reviews code quality and test coverage.

**When to use:**
- Code review
- Test quality assessment
- TDD compliance checking

**Capabilities:**
- Test coverage analysis
- Quality metrics
- Best practices validation

**Handoffs available:**
- Implementation Support → @dev
- Party Mode → Multi-agent discussion

---

## Commands

### Greenfield Workflow

| Command | Agent | Input Required | Output |
|---------|-------|----------------|--------|
| `/prd` | @pm | Product idea/description | `specs/prd.md` |
| `/frd` | @pm | Existing PRD | `specs/features/*.md` |
| `/plan` | @planner | PRD + FRDs | `specs/tasks/*.md` |
| `/implement` | @dev | Tasks | Source code |
| `/delegate` | @dev | Tasks | GitHub Issues |
| `/deploy` | @azure | Source code | Azure resources |

### Brownfield Workflow

| Command | Agent | Input Required | Output |
|---------|-------|----------------|--------|
| `/rev-eng` | @tech-analyst | Existing codebase | Documentation |
| `/modernize` | @modernizer | Documented codebase | Modernization plan |

### Utility Commands

| Command | Agent | Purpose |
|---------|-------|---------|
| `/adr` | @architect | Create Architecture Decision Record |
| `/generate-agents` | @architect | Generate AGENTS.md |

---

## Workflows

### Greenfield: Idea to Deployment

```mermaid
graph TD
    A[Product Idea] --> B[/prd]
    B --> C[specs/prd.md]
    C --> D[/frd]
    D --> E[specs/features/*.md]
    E --> F[/plan]
    F --> G[specs/tasks/*.md]
    G --> H{Implementation}
    H -->|Local| I[/implement]
    H -->|Delegated| J[/delegate]
    I --> K[Source Code]
    J --> K
    K --> L[/deploy]
    L --> M[Azure Resources]
```

### Brownfield: Code to Documentation

```mermaid
graph TD
    A[Existing Codebase] --> B[/rev-eng]
    B --> C[Documentation]
    C --> D{Modernize?}
    D -->|Yes| E[/modernize]
    E --> F[Modernization Plan]
    F --> G[/plan]
    G --> H[/implement]
    D -->|No| I[Done]
    H --> J[/deploy]
```

---

## Output Files

### specs/prd.md
Product Requirements Document containing:
- Purpose and scope
- Goals and success criteria
- High-level requirements
- User stories
- Assumptions and constraints

### specs/features/*.md
Feature Requirements Documents containing:
- Feature description
- User stories
- Acceptance criteria
- Dependencies
- Out of scope items

### specs/tasks/*.md
Technical task specifications containing:
- Task title and description
- Dependencies
- Technical requirements
- Acceptance criteria
- Testing requirements

### specs/adr/*.md
Architecture Decision Records containing:
- Context and problem
- Decision
- Consequences
- Alternatives considered

### AGENTS.md
Consolidated engineering standards containing:
- Coding standards
- Architecture patterns
- Testing requirements
- Documentation standards

---

## Advanced Features

### Party Mode

Multi-agent collaborative discussion. Available from most agents via the "Party Mode" handoff button.

**How it works:**
1. Click "Party Mode" in agent handoffs
2. Multiple agents join the discussion
3. Each provides their perspective
4. Collaborative problem-solving

**When to use:**
- Complex architectural decisions
- Trade-off discussions
- Cross-cutting concerns

### Step-Based Workflows

Located in `.ask/workflows/`, these provide guided step-by-step processes:

- `.ask/workflows/prd/workflow.md` - Comprehensive PRD creation
- `.ask/core/workflows/party-mode/workflow.md` - Party mode coordination

### Knowledge Base

Located in `.ask/knowledge/`:

- `tdd-discipline.md` - Test-Driven Development best practices
- `test-quality.md` - Test quality guidelines
- `network-first.md` - Network-first development patterns

### Project Context

The `project-context.md` file serves as the "source of truth" for all agents:

1. Copy template: `cp project-context.md.template project-context.md`
2. Fill in project details
3. Agents automatically reference it

---

## Best Practices

### 1. Sequential Flow
Follow the workflow sequence. Each step builds on the previous:
```
/prd → /frd → /plan → /implement → /deploy
```

### 2. Review Between Steps
Check generated files before moving to next step:
- Does PRD capture intent?
- Are FRDs complete?
- Are tasks implementable?

### 3. Use Handoffs
Click handoff buttons rather than switching agents manually. This preserves context.

### 4. Iterate
Documents are living. Return to refine:
```
@pm Please add OAuth requirements to the PRD
```

### 5. Trust the Process
Let agents ask questions. Don't over-specify upfront.

---

## Troubleshooting

### Agent Not Found
```
@agent_name not recognized
```
**Solution:** Reload VS Code, check `.github/agents/` folder

### Command Not Working
```
/command not found
```
**Solution:** Check `.github/prompts/` folder, try full path `/command.prompt.md`

### Missing Context
Agents seem confused about project.
**Solution:** Create and fill `project-context.md`

### Handoff Not Appearing
Button not shown in chat.
**Solution:** Scroll down in chat, or manually invoke agent

---

## Quick Reference Card

```
GREENFIELD: /prd → /frd → /plan → /implement → /deploy
BROWNFIELD: /rev-eng → /modernize → /plan → /deploy

AGENTS:
  @ask  - Start here (orchestrator)
  @pm          - Requirements (PRD, FRD)
  @devlead     - Technical review
  @architect   - Architecture (ADR)
  @planner     - Task breakdown
  @dev         - Implementation (TDD)
  @azure       - Deployment
  @tech-analyst - Reverse engineering
  @modernizer  - Modernization
  @tea         - Test review

OUTPUT:
  specs/prd.md         - Product requirements
  specs/features/*.md  - Feature specs
  specs/tasks/*.md     - Technical tasks
  specs/adr/*.md       - Architecture decisions
```

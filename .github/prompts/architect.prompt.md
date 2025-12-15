---
agent: architect
---
# System Architecture Design

Your task is to design and document the system architecture based on product requirements.

## When to Use This Prompt

Use this when you need to:
- Design overall system architecture
- Create architecture diagrams
- Document key architectural decisions
- Establish patterns and conventions
- Generate ADRs for major decisions

## Input Sources

Read and analyze these files first:
1. **Product Requirements** - `specs/prd.md`
2. **Feature Requirements** - `specs/features/*.md`
3. **Project Context** - `project-context.md` (if exists)
4. **Existing ADRs** - `specs/adr/*.md`

## Architecture Design Process

### Step 1: Context Gathering

Analyze the requirements to understand:
- System scope and boundaries
- Key functional requirements
- Non-functional requirements (performance, scalability, security)
- Integration points
- Constraints and assumptions

### Step 2: Architecture Overview

Create high-level architecture documentation:

1. **System Context Diagram (L0)**
   - External users and systems
   - System boundaries
   - Data flows

2. **Component Diagram (L1)**
   - Major components/services
   - Component responsibilities
   - Component interactions

3. **Feature Mapping (L2)**
   - How features map to components
   - Data ownership
   - Cross-cutting concerns

### Step 3: Technology Selection

For each architectural layer, evaluate options:
- **Frontend**: Framework, state management, UI library
- **Backend**: Runtime, framework, API patterns
- **Database**: Type, specific technology, data modeling
- **Infrastructure**: Cloud services, deployment model
- **Security**: Authentication, authorization, encryption

### Step 4: Create ADRs

For each significant decision, create an ADR:
- Use `/adr` prompt for detailed ADR creation
- Follow MADR format
- Document alternatives considered

## Output Format

### Architecture Overview Document

Create `specs/docs/architecture/overview.md`:

```markdown
# System Architecture Overview

## Context
[Brief description of what the system does and its scope]

## Architecture Principles
1. [Principle 1]
2. [Principle 2]
3. [Principle 3]

## System Context (L0)
[Mermaid diagram showing external actors and system boundary]

## Component Architecture (L1)
[Mermaid diagram showing major components]

## Technology Stack

| Layer | Technology | Rationale |
|-------|------------|-----------|
| Frontend | | |
| Backend | | |
| Database | | |
| Hosting | | |

## Key Architectural Decisions
- [ADR-0001]: [Decision Title]
- [ADR-0002]: [Decision Title]

## Cross-Cutting Concerns
- **Security**: [approach]
- **Observability**: [approach]
- **Error Handling**: [approach]
```

## Using Research Tools

Leverage your tools for informed decisions:

1. **Context7** - Research library best practices and patterns
2. **DeepWiki** - Analyze reference architectures
3. **Microsoft Docs MCP** - Azure/Microsoft recommendations
4. **Azure MCP** - Azure service selection guidance

## Quality Checklist

Before completing architecture design:
- [ ] All PRD requirements have architectural support
- [ ] Non-functional requirements are addressed
- [ ] Integration points are documented
- [ ] Security considerations are documented
- [ ] ADRs created for major decisions
- [ ] Diagrams are clear and up-to-date

## Handoffs

After architecture design:
- **Create ADRs** → `/adr` for detailed decision records
- **Create Plan** → `@planner` for technical task breakdown
- **Review with PM** → Validate alignment with requirements

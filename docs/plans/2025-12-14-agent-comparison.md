# Agent Comparison: Spec2Cloud vs BMAD

This document compares agents between the spec2cloud template and BMAD to identify features to merge into the agile-sensing-kit.

## Executive Summary

| Aspect | Spec2Cloud | BMAD | Winner/Merge Strategy |
|--------|-----------|------|----------------------|
| **Memory/Persistence** | None | project-context.md as "bible" | BMAD - Add Agent Mail |
| **Agent Personas** | Role descriptions only | Named personas with communication styles | BMAD - More engaging |
| **Multi-Agent** | Handoffs only | Party-mode built into each agent | BMAD - Add party-mode |
| **Activation** | Direct instructions | Menu-driven with numbered choices | Hybrid - Keep both |
| **TDD Discipline** | Mentioned | Strictly enforced red-green-refactor | BMAD - Stronger discipline |
| **Agile Ceremonies** | None | Sprint planning, retrospectives, stories | BMAD - Add ceremonies |
| **Test Architecture** | None | Dedicated TEA agent with knowledge base | BMAD - Add TEA |
| **Azure Deployment** | Full azure agent | None | Spec2cloud - Keep |
| **MCP Tools** | Extensive list per agent | Minimal | Spec2cloud - Keep |
| **GitHub Copilot** | Native support | Claude Code focused | Spec2cloud - Keep |

---

## Resource Infrastructure Comparison

This section compares the underlying resources that power each system—a critical difference that affects agent capabilities.

### File Count Comparison

| Resource Type | Spec2Cloud | BMAD | Gap |
|--------------|-----------|------|-----|
| **Total markdown files** | 19 | 229 | 12x |
| **Agent definitions** | 9 | ~10 | ≈ equal |
| **Prompt/workflow files** | 10 | ~80 | 8x |
| **Step files (workflow stages)** | 0 | ~100 | ∞ |
| **Knowledge base files** | 0 | 32 | ∞ |
| **Templates** | ~3 | ~15 | 5x |
| **Resource/helper files** | 0 | ~10 | ∞ |

### BMAD Resource Architecture

```
.bmad/
├── core/                          # Shared across all BMAD variants
│   ├── agents/                    # Base agent definitions
│   ├── tasks/                     # Reusable task definitions
│   ├── tools/                     # Tool configurations
│   ├── resources/                 # Shared resources
│   │   └── excalidraw/           # Diagram generation helpers
│   └── workflows/                 # Core workflows
│       ├── party-mode/           # Multi-agent collaboration
│       │   ├── workflow.md
│       │   └── steps/            # 3 step files
│       └── brainstorming/        # Ideation workflow
│           ├── workflow.md
│           └── steps/            # 8 step files
│
├── bmm/                           # BMAD Method (specific methodology)
│   ├── agents/                    # Method-specific agents
│   ├── tasks/                     # Method-specific tasks
│   ├── workflows/                 # Phase-organized workflows
│   │   ├── 1-analysis/           # Research phase
│   │   ├── 2-plan-workflows/     # Planning phase
│   │   │   ├── prd/              # 11 step files + template
│   │   │   └── create-ux-design/ # 14 step files + template
│   │   ├── 3-solutioning/        # Architecture phase
│   │   │   ├── architecture/     # 8 step files + template
│   │   │   ├── create-epics-and-stories/  # 4 step files
│   │   │   └── implementation-readiness/  # 6 step files
│   │   ├── 4-implementation/     # Execution phase
│   │   │   ├── dev-story/
│   │   │   ├── sprint-planning/
│   │   │   ├── retrospective/
│   │   │   └── code-review/
│   │   ├── testarch/             # Testing workflows
│   │   └── diagrams/             # Visualization workflows
│   ├── testarch/
│   │   └── knowledge/            # 32 knowledge base files
│   ├── teams/                    # Team configurations
│   └── data/                     # Shared data
│
└── _cfg/                         # User configuration
    ├── agents/                   # Custom agent overrides
    └── custom/                   # Project-specific customizations
```

### Spec2Cloud Resource Architecture

```
.github/
├── agents/                       # 9 agent definitions (flat)
│   ├── pm.agent.md
│   ├── dev.agent.md
│   ├── devlead.agent.md
│   └── ... (6 more)
└── prompts/                      # 10 prompt files (flat)
    ├── prd.prompt.md
    ├── frd.prompt.md
    ├── plan.prompt.md
    └── ... (7 more)
```

### Key Differences

| Aspect | Spec2Cloud | BMAD |
|--------|-----------|------|
| **Structure** | Flat (agents/ + prompts/) | Hierarchical (core → bmm → phases) |
| **Workflow granularity** | 1 file per workflow | Workflow + 3-14 step files each |
| **Knowledge base** | None | 32 specialized testing patterns |
| **Templates** | Embedded in prompts | Separate template files |
| **Phase organization** | Linear handoffs | Explicit phases (analysis→plan→solution→implement) |
| **Customization layer** | None | _cfg/ folder for overrides |
| **Modularity** | Monolithic agents | core/ shared, bmm/ method-specific |

---

### Step-Based Workflows (BMAD Advantage)

BMAD workflows use numbered steps that guide agents through complex processes:

**Example: PRD Workflow (11 steps)**
```
prd/
├── workflow.md           # Entry point + routing logic
├── prd-template.md       # Output template
└── steps/
    ├── step-01-init.md           # Load config, greet user
    ├── step-01b-continue.md      # Resume existing PRD
    ├── step-02-discovery.md      # Problem space exploration
    ├── step-03-success.md        # Success criteria
    ├── step-04-journeys.md       # User journey mapping
    ├── step-05-domain.md         # Domain analysis
    ├── step-06-innovation.md     # Innovation opportunities
    ├── step-07-project-type.md   # Project classification
    ├── step-08-scoping.md        # Scope definition
    ├── step-09-functional.md     # Functional requirements
    ├── step-10-nonfunctional.md  # Non-functional requirements
    └── step-11-complete.md       # Finalization
```

**Why this matters:**
1. Each step has focused instructions (no context dilution)
2. Agents can pause/resume at any step
3. Steps can be customized independently
4. Clear progress tracking through the workflow
5. Easier to debug which step went wrong

**Spec2Cloud equivalent:** Single `prd.prompt.md` file (~200 lines) with all instructions in one place.

---

### Knowledge Base (BMAD Advantage)

BMAD's TEA agent has access to 32 specialized testing knowledge files:

| Category | Files | Purpose |
|----------|-------|---------|
| **Test Architecture** | fixture-architecture.md, fixtures-composition.md, test-levels-framework.md | Structural testing patterns |
| **Test Execution** | burn-in.md, ci-burn-in.md, selective-testing.md | Execution strategies |
| **Network Testing** | network-first.md, intercept-network-call.md, network-recorder.md | API/network patterns |
| **Authentication** | auth-session.md, email-auth.md | Auth testing patterns |
| **Visual/Debug** | visual-debugging.md, timing-debugging.md, log.md | Debugging techniques |
| **Quality** | test-quality.md, test-healing-patterns.md, selector-resilience.md | Quality patterns |
| **Risk** | risk-governance.md, probability-impact.md, nfr-criteria.md | Risk assessment |
| **Data** | data-factories.md, contract-testing.md, feature-flags.md | Data management |
| **Framework** | playwright-config.md, component-tdd.md, api-request.md | Framework specifics |

**Why this matters:**
- TEA can pull specific knowledge files based on the testing challenge
- Knowledge is maintained separately from agent instructions
- Can be extended without modifying agents
- Provides consistent patterns across projects

**Spec2Cloud equivalent:** None. Testing guidance embedded in dev agent.

---

### Excalidraw Resources (BMAD Advantage)

BMAD includes helpers for generating Excalidraw diagrams:
- `excalidraw-helpers.md` - Layout functions, shapes, connectors
- `library-loader.md` - Load custom shape libraries
- `validate-json-instructions.md` - Ensure valid Excalidraw JSON

**Spec2Cloud equivalent:** Relies on Mermaid Chart MCP server (different approach, less control).

---

### Phase Organization (BMAD Advantage)

BMAD workflows are organized by development phase:

```
1-analysis/     → Research, brownfield documentation
2-plan-workflows/ → PRD, UX design
3-solutioning/  → Architecture, epics/stories, readiness check
4-implementation/ → Sprint planning, dev-story, code review
```

This provides:
- Clear progression through SDLC
- Phase-specific tools and templates
- Easier to know where you are in the process

**Spec2Cloud equivalent:** Implicit phases via handoffs (less clear structure).

---

## Agent-by-Agent Comparison

### 1. Product Manager (PM)

| Feature | Spec2Cloud PM | BMAD PM (John) |
|---------|--------------|----------------|
| **Persona** | Generic "Product Manager Agent" | "John" - Investigative strategist, asks "WHY?" relentlessly |
| **Core Focus** | WHAT vs HOW separation (excellent) | Menu-driven workflow execution |
| **Activation** | Direct instructions | Config.yaml loading, numbered menu |
| **Party Mode** | ❌ No | ✅ Built-in menu item |
| **Handoffs** | ✅ To devlead, planner | Via workflow system |
| **Project Context** | ❌ No | ✅ project-context.md as bible |
| **Output Location** | specs/prd.md, specs/features/ | Configurable output_folder |

**🔀 Merge Strategy:**
- KEEP: Spec2cloud's WHAT vs HOW separation guidelines (excellent)
- ADD: BMAD's persona name and communication style
- ADD: Party-mode access
- ADD: project-context.md awareness
- ADD: Config-based user personalization

---

### 2. Developer (Dev)

| Feature | Spec2Cloud Dev | BMAD Dev (Amelia) |
|---------|---------------|------------------|
| **Persona** | Generic "Developer Agent" | "Amelia" - Ultra-succinct, speaks in file paths |
| **TDD** | Mentioned in guidelines | **STRICTLY ENFORCED**: Read story → red-green-refactor → mark complete |
| **Story-Driven** | Task breakdown | Story file as **single source of truth** |
| **Test Requirement** | General | "NEVER lie about tests" - must actually exist and pass 100% |
| **Implementation Order** | Flexible | **Strict**: tasks/subtasks IN ORDER, no skipping |
| **MCP Tools** | Extensive (context7, github, Azure MCP, AI Toolkit) | Minimal |
| **Code Review** | Via handoff to devlead | Built-in menu item |
| **Continuous Execution** | Not specified | Execute until HALT or completion |

**🔀 Merge Strategy:**
- KEEP: Spec2cloud's extensive MCP tool access
- ADD: BMAD's strict TDD discipline and red-green-refactor cycle
- ADD: Story file as single source of truth pattern
- ADD: "NEVER lie about tests" rule
- ADD: Strict task ordering enforcement
- ADD: Amelia's persona for character

---

### 3. Architect

| Feature | Spec2Cloud Architect | BMAD Architect (Winston) |
|---------|---------------------|-------------------------|
| **Persona** | Generic | "Winston" - Calm, pragmatic, champions boring technology |
| **Focus** | ADRs, AGENTS.md synthesis | Architecture document, implementation readiness |
| **Diagrams** | Via Mermaid in planner | Excalidraw diagrams built-in |
| **Party Mode** | ❌ No | ✅ Built-in |
| **Validation** | Via handoffs | Implementation readiness workflow |
| **Research** | context7, deepwiki, microsoft.docs.mcp | Similar |

**🔀 Merge Strategy:**
- KEEP: Spec2cloud's ADR workflow (excellent)
- KEEP: AGENTS.md synthesis capability
- ADD: Winston's "boring technology" philosophy
- ADD: Implementation readiness validation
- ADD: Excalidraw diagram generation
- ADD: Party-mode

---

### 4. Dev Lead vs Scrum Master

| Feature | Spec2Cloud DevLead | BMAD SM (Bob) |
|---------|-------------------|---------------|
| **Role** | Technical review, simplicity-first | Sprint planning, story preparation |
| **Focus** | Requirements completeness | Agile ceremonies |
| **Agile** | ❌ No ceremonies | ✅ Sprint planning, retrospectives, course correction |
| **Story Prep** | ❌ No | ✅ create-story workflow |
| **Validation** | Requirements review | Story validation workflow |

**🔀 Merge Strategy:**
- KEEP: Spec2cloud devlead's simplicity-first philosophy (excellent)
- ADD: BMAD SM's sprint-planning capability
- ADD: Story creation workflow
- ADD: Retrospective workflow
- ADD: Course correction workflow
- CONSIDER: Merge into single agent or keep separate

---

### 5. Analyst (BMAD-only)

| Feature | Spec2Cloud | BMAD Analyst (Mary) |
|---------|-----------|---------------------|
| **Exists** | ❌ No (closest: tech-analyst) | ✅ Full agent |
| **Role** | - | Strategic Business Analyst, requirements expert |
| **Capabilities** | - | Research, product brief, document-project, brainstorming |
| **Persona** | - | "Mary" - Treats analysis like treasure hunt |

**🔀 Merge Strategy:**
- ADD: Full analyst agent with research, product-brief, document-project
- MERGE: With spec2cloud's tech-analyst for brownfield workflows

---

### 6. Test Engineer Agent (TEA) - BMAD-only

| Feature | Spec2Cloud | BMAD TEA (Murat) |
|---------|-----------|------------------|
| **Exists** | ❌ No | ✅ Full agent with knowledge base |
| **Capabilities** | - | Framework init, ATDD, automation, test-design, trace, NFR, CI |
| **Knowledge Base** | - | 30+ knowledge fragments (fixtures, selectors, burn-in, etc.) |
| **Persona** | - | "Murat" - Strong opinions weakly held, risk calculations |

**🔀 Merge Strategy:**
- ADD: Full TEA agent - this is a major gap in spec2cloud
- ADD: testarch knowledge base
- INTEGRATE: With spec2cloud's test workflows

---

### 7. Quick Flow Solo Dev (BMAD-only)

| Feature | Spec2Cloud | BMAD Quick Flow (Barry) |
|---------|-----------|------------------------|
| **Exists** | ❌ No | ✅ Solo dev fast-track |
| **Role** | - | Elite developer, concept to deployment |
| **Workflow** | - | tech-spec → quick-dev → code-review |
| **Persona** | - | "Barry" - Direct, confident, ships fast |

**🔀 Merge Strategy:**
- ADD: Quick Flow agent for solo/rapid development scenarios
- ALIGN: With spec2cloud's implement/delegate workflows

---

### 8. Azure Agent (Spec2Cloud-only)

| Feature | Spec2Cloud Azure | BMAD |
|---------|-----------------|------|
| **Exists** | ✅ Full agent | ❌ No |
| **Capabilities** | azd, Bicep, IaC, CI/CD, Azure services | - |
| **MCP Tools** | Azure MCP, Bicep, microsoft.docs.mcp | - |

**🔀 Merge Strategy:**
- KEEP: Full azure agent - this is spec2cloud's strength
- ADD: Party-mode access for collaboration with other agents

---

### 9. UX Designer & Tech Writer (BMAD-only)

| Agent | Spec2Cloud | BMAD |
|-------|-----------|------|
| **UX Designer (Sally)** | ❌ No | ✅ User research, interaction design |
| **Tech Writer (Paige)** | ❌ No | ✅ Documentation specialist |

**🔀 Merge Strategy:**
- ADD: Both agents as optional for full-team workflows
- INTEGRATE: With party-mode for collaborative sessions

---

## Unique BMAD Features to Add

### 1. **Menu-Driven Activation System**
```xml
<activation>
  <step n="1">Load config.yaml</step>
  <step n="2">Greet user by name</step>
  <step n="3">Display numbered menu</step>
  <step n="4">WAIT for input</step>
</activation>
```
- Provides consistent UX across agents
- Supports fuzzy command matching
- Clear entry/exit points

### 2. **Party Mode (Multi-Agent Collaboration)**
Every BMAD agent can invoke party-mode to bring other experts into the conversation. This enables:
- Group discussions on complex decisions
- Multi-perspective reviews
- Natural workflow handoffs

### 3. **Project Context as Bible**
All BMAD agents reference `**/project-context.md` as their authoritative source:
```
Find if this exists, if it does, always treat it as the bible I plan and execute against
```

### 4. **Config-Based Personalization**
```yaml
# .bmad/core/config.yaml
user_name: "Etido"
communication_language: "English"
output_folder: "specs/"
```

### 5. **Advanced Elicitation**
Built into every agent menu - techniques to challenge the LLM for better results.

---

## Unique Spec2Cloud Features to Keep

### 1. **Extensive MCP Tool Lists**
Spec2cloud agents have rich tool access:
- context7, deepwiki, github, microsoft.docs.mcp
- Azure MCP, Bicep Experimental
- AI Toolkit (Windows AI Studio)
- Mermaid Chart

### 2. **Handoffs with Agent Routing**
```yaml
handoffs:
  - label: Create PRD (/prd)
    agent: pm
    prompt: file:.github/prompts/prd.prompt.md
```

### 3. **WHAT vs HOW Discipline**
PM agent has excellent guidelines:
- ✅ "The system must support real-time collaboration"
- ❌ "Use SignalR hubs with WebSocket connections"

### 4. **Simplicity-First Philosophy (DevLead)**
- Default to in-memory, file-based solutions
- DON'T add databases unless explicitly requested
- Start simple, iterate based on explicit needs

### 5. **Azure Deployment Expertise**
Full IaC, azd, Bicep, GitHub Actions pipeline generation.

---

## Agent Mail Integration Points

Agent Mail should integrate with:

1. **Session Start**: Register agent, load inbox
2. **Task Tracking**: Store tasks/subtasks progress
3. **Agent Handoffs**: Message passing between agents
4. **File Reservations**: Prevent concurrent edits
5. **History Access**: New sessions can read previous context
6. **Thread Summaries**: Understand previous discussions

---

## Recommended Merge Priority

### Phase 0: Resource Architecture Decision ⚠️ CRITICAL

**Decision required:** Should agile-sensing-kit adopt BMAD's hierarchical resource architecture?

| Option | Pros | Cons |
|--------|------|------|
| **A: Keep flat structure** | Simpler, GitHub Copilot native | Limited workflow depth, no knowledge base |
| **B: Adopt BMAD structure** | 12x more resources, step-based workflows, knowledge base | Major restructure, different from GitHub Copilot conventions |
| **C: Hybrid** | Best of both worlds | More complex to maintain |

**Recommendation: Option C (Hybrid)**
```
.github/
├── agents/           # Keep for GitHub Copilot compatibility
└── prompts/          # Keep for simple prompts

.ask/                 # New: BMAD-style resource layer (named for agile-sensing-kit)
├── workflows/        # Step-based workflows
│   ├── prd/
│   │   ├── workflow.md
│   │   └── steps/
│   └── ...
├── knowledge/        # Testing knowledge base
├── resources/        # Excalidraw helpers, templates
└── config.yaml       # User configuration
```

This allows:
- GitHub Copilot agents work as-is
- Complex workflows get BMAD-style depth
- Knowledge base available to all agents
- No breaking changes to existing users

---

### Phase 1: Core Memory (Agent Mail)
1. Integrate Agent Mail MCP as always-on
2. Add macro_start_session to agent activation
3. Store task/story progress via messages
4. Enable file reservations for concurrent safety

### Phase 2: Resource Infrastructure
1. **Create `.ask/` folder structure** (or chosen name)
2. **Port testarch knowledge base** (32 files) - massive value add
3. **Add step-based PRD workflow** - convert existing prd.prompt.md
4. **Add Excalidraw helpers** - supplement Mermaid MCP

### Phase 3: Agent Augmentation
1. Add personas to existing spec2cloud agents
2. Add party-mode to all agents
3. Add project-context.md awareness
4. Strengthen dev agent with BMAD's TDD discipline
5. **Connect agents to knowledge base**

### Phase 4: New Agents
1. Add TEA (Test Engineer Agent) - major gap
2. Add Quick Flow Solo Dev for rapid work
3. Add Analyst (merge with tech-analyst)

### Phase 5: Agile Ceremonies
1. Add sprint-planning workflow (step-based)
2. Add retrospective workflow (step-based)
3. Add course-correction workflow
4. Add story creation workflow (step-based)

### Phase 6: Polish
1. Add UX Designer agent
2. Add Tech Writer agent
3. Add Excalidraw diagram workflows
4. Add brainstorming workflow (8 steps from BMAD)

---

## Resource Porting Checklist

### High Priority (Immediate Value)

- [ ] `testarch/knowledge/` → 32 testing knowledge files
- [ ] `workflows/prd/` → 11-step PRD workflow
- [ ] `workflows/architecture/` → 8-step architecture workflow
- [ ] `core/workflows/brainstorming/` → 8-step brainstorming
- [ ] `core/workflows/party-mode/` → 3-step multi-agent mode

### Medium Priority (Phase Completeness)

- [ ] `workflows/create-ux-design/` → 14-step UX workflow
- [ ] `workflows/create-epics-and-stories/` → 4-step story workflow
- [ ] `workflows/implementation-readiness/` → 6-step readiness check
- [ ] `workflows/4-implementation/sprint-planning/`
- [ ] `workflows/4-implementation/retrospective/`

### Lower Priority (Nice to Have)

- [ ] `core/resources/excalidraw/` → Diagram helpers
- [ ] `_cfg/` structure → User customization layer
- [ ] `teams/` → Team configurations
- [ ] `data/` → Shared data patterns

---

## Summary

The original comparison focused on **agent features** but missed the **resource infrastructure** that makes BMAD powerful:

| What I Compared | What I Missed |
|-----------------|---------------|
| Agent personas | 229 vs 19 total resources |
| Party mode | Step-based workflows |
| TDD discipline | 32-file knowledge base |
| Menu activation | Phase organization |
| Handoffs | Templates as separate files |
| MCP tools | Customization layer (_cfg/) |

The resource infrastructure is arguably more important than agent features because it provides:
1. **Depth** - Complex workflows broken into focused steps
2. **Knowledge** - Reusable patterns agents can reference
3. **Maintainability** - Changes to one step don't affect others
4. **Extensibility** - Add new steps/knowledge without touching agents

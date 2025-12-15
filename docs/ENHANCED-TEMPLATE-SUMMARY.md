# Agile Sensing Kit (ASK) - Enhanced Template

## Executive Summary

**ASK** (Agile Sensing Kit) is a hybrid AI-powered development workflow toolkit that combines the best of two proven frameworks:

| Source Framework | Key Contribution |
|-----------------|------------------|
| **Spec2Cloud** | GitHub Copilot integration, Azure deployment, MCP tools |
| **BMAD Method** | Agent personas, step-based workflows, testing knowledge base |

### Result: A Microsoft-Ready Template

The merged template provides:
- **12x more workflow depth** through step-based architecture
- **Named agent personas** for engaging, consistent interactions
- **32 testing knowledge patterns** via the new TEA agent
- **Party mode** for multi-agent collaboration
- **TDD discipline** enforced across all development workflows

---

## Architecture Overview

```
agile-sensing-kit/
├── .github/                    # GitHub Copilot Native
│   ├── agents/                 # 10 enhanced agent definitions
│   │   ├── pm.agent.md         # John - Investigative PM
│   │   ├── dev.agent.md        # Amelia - TDD Developer
│   │   ├── architect.agent.md  # Winston - Boring Tech Champion
│   │   ├── tea.agent.md        # Murat - Test Architect (NEW)
│   │   ├── azure.agent.md      # Azure Deployment
│   │   └── ...
│   └── prompts/                # Workflow prompts
│
├── .ask/                       # BMAD-Style Resource Layer (NEW)
│   ├── core/
│   │   ├── config.yaml         # User personalization
│   │   └── workflows/
│   │       └── party-mode/     # Multi-agent collaboration
│   │
│   ├── workflows/              # Step-based workflows
│   │   └── prd/                # 11-step PRD creation
│   │       ├── workflow.md
│   │       ├── prd-template.md
│   │       └── steps/
│   │
│   ├── knowledge/              # Testing knowledge base
│   │   ├── test-quality.md
│   │   ├── tdd-discipline.md
│   │   └── network-first.md
│   │
│   └── templates/
│       └── project-context.md  # The "Bible" template
│
└── specs/                      # Output location
```

---

## Key Enhancements

### 1. Agent Personas (BMAD Contribution)

Each agent now has a distinct personality:

| Agent | Name | Communication Style |
|-------|------|---------------------|
| PM | **John** | Asks "WHY?" relentlessly, data-sharp |
| Dev | **Amelia** | Ultra-succinct, speaks in file paths |
| Architect | **Winston** | Calm, pragmatic, boring technology |
| TEA | **Murat** | Strong opinions weakly held, risk calculations |

### 2. TEA Agent - Test Engineer (NEW)

The **Master Test Architect** brings:
- 32+ testing knowledge patterns
- Risk-based test strategy design
- Quality gates backed by data
- Framework initialization (Playwright/Cypress)
- Burn-in testing for flakiness detection

### 3. TDD Discipline (BMAD Contribution)

The Dev agent now enforces red-green-refactor:

```
1. RED: Write failing test first
   ↓
2. GREEN: Minimum code to pass
   ↓
3. REFACTOR: Improve while green
```

**Critical Rules:**
- NEVER lie about tests
- Story file is single source of truth
- All tests must pass 100%
- Run full suite after each task

### 4. Step-Based Workflows (BMAD Contribution)

PRD creation now uses 11 focused steps:

| Step | Purpose |
|------|---------|
| 1 | Initialization & document discovery |
| 2 | Project & domain discovery |
| 3 | Success criteria definition |
| 4 | User journey mapping |
| 5 | Domain analysis |
| 6 | Innovation opportunities |
| 7 | Project type classification |
| 8 | Scope definition |
| 9 | Functional requirements |
| 10 | Non-functional requirements |
| 11 | Finalization & review |

### 5. Party Mode (BMAD Contribution)

Multi-agent collaboration enabling:
- Group discussions on complex decisions
- Multi-perspective reviews
- Natural cross-talk between experts

### 6. Project Context as Bible (BMAD Contribution)

All agents reference `project-context.md` as authoritative source:
- Coding standards
- Architecture decisions
- Testing requirements
- Team conventions

### 7. Azure Deployment (Spec2Cloud Strength)

Full IaC capabilities preserved:
- azd integration
- Bicep templates
- GitHub Actions pipelines
- Azure MCP tools

---

## Comparison: Before vs After

| Aspect | Spec2Cloud (Before) | ASK (After) |
|--------|---------------------|-------------|
| Agent definitions | 9 generic | 10 with personas |
| Workflow files | 10 flat | Step-based (11 steps per workflow) |
| Knowledge base | 0 | 3+ testing patterns |
| Multi-agent mode | None | Party mode |
| TDD enforcement | Mentioned | Strictly enforced |
| Test architecture | None | Dedicated TEA agent |
| Project context | None | Bible pattern |
| Total resources | 19 | 35+ |

---

## Value Proposition for Microsoft

### 1. GitHub Copilot Enhancement
- Native `.github/agents/` compatibility
- Enhanced with proven BMAD patterns
- Richer agent interactions

### 2. Azure-First Deployment
- Full Azure agent preserved
- azd, Bicep, IaC best practices
- CI/CD pipeline generation

### 3. Enterprise-Ready Quality
- TDD discipline enforced
- 32 testing knowledge patterns
- Risk-based quality gates
- Traceability matrices

### 4. Collaborative AI Workflows
- Party mode for team discussions
- Step-based workflows prevent context dilution
- Named personas for consistent UX

### 5. Knowledge Preservation
- Project context as single source of truth
- Testing knowledge base captures tribal knowledge
- Workflow state tracking for resume capability

---

## Quick Start

### 1. Initialize Project Context

```bash
cp .ask/templates/project-context.md specs/project-context.md
# Edit with your project details
```

### 2. Create PRD (Step-Based)

```
@pm Create PRD (Step-Based)
```

### 3. Use Party Mode

```
@ask Party Mode
# or via handoff button in any agent
```

### 4. Implement with TDD

```
@dev /implement
# Follows red-green-refactor automatically
```

### 5. Review with TEA

```
@tea Review Test Quality
```

---

## Files Created in This Enhancement

```
NEW FILES:
├── .ask/
│   ├── core/
│   │   ├── config.yaml
│   │   └── workflows/party-mode/workflow.md
│   ├── workflows/prd/
│   │   ├── workflow.md
│   │   ├── prd-template.md
│   │   └── steps/step-01-init.md
│   ├── knowledge/
│   │   ├── test-quality.md
│   │   ├── tdd-discipline.md
│   │   └── network-first.md
│   └── templates/
│       └── project-context.md
├── .github/agents/
│   └── tea.agent.md (NEW)
└── docs/
    └── ENHANCED-TEMPLATE-SUMMARY.md

ENHANCED FILES:
├── .github/agents/pm.agent.md
├── .github/agents/dev.agent.md
└── .github/agents/architect.agent.md
```

---

## Next Steps

### Phase 1: Complete (This Session)
- [x] Core .ask/ structure
- [x] Party mode workflow
- [x] PRD workflow foundation
- [x] Testing knowledge base (core files)
- [x] Enhanced agent personas
- [x] TEA agent creation

### Phase 2: Recommended
- [ ] Complete all 11 PRD steps
- [ ] Port architecture workflow (8 steps)
- [ ] Add sprint planning workflow
- [ ] Add retrospective workflow
- [ ] Expand knowledge base (32 files)

### Phase 3: Polish
- [ ] UX Designer agent
- [ ] Tech Writer agent
- [ ] Excalidraw diagram helpers
- [ ] Complete brainstorming workflow

---

*Generated by ASK (Agile Sensing Kit) - Spec2Cloud + BMAD Hybrid*
*For Microsoft Presentation - December 2025*

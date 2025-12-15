# Spec2Cloud - AI-Powered Development Workflows

Transform any project into a spec2cloud-enabled development environment with specialized GitHub Copilot agents and workflows.

## What's Included

This package contains:

### 10 Specialized AI Agents

| Agent | Role | Purpose |
|-------|------|---------|
| **@ask** | Orchestrator | Routes requests to specialized agents |
| **@pm** | Product Manager | PRD and feature requirements |
| **@devlead** | Technical Lead | Technical feasibility review |
| **@architect** | System Architect | Architecture decisions and ADRs |
| **@planner** | Task Planner | Technical task breakdown |
| **@dev** | Developer | TDD implementation |
| **@azure** | Cloud Specialist | Azure deployment |
| **@tech-analyst** | Reverse Engineer | Document existing code |
| **@modernizer** | Modernization Expert | Legacy system upgrades |
| **@tea** | Test Engineer | Code review and test quality |

### 10 Workflow Commands

**Greenfield (New Projects):**
- `/prd` - Create Product Requirements Document
- `/frd` - Create Feature Requirements Documents
- `/plan` - Create Technical Task Breakdown
- `/implement` - Implement features with TDD
- `/delegate` - Delegate to GitHub Copilot coding agent
- `/deploy` - Deploy to Azure

**Brownfield (Existing Code):**
- `/rev-eng` - Reverse engineer codebase into documentation
- `/modernize` - Create modernization plan

**Utilities:**
- `/adr` - Create Architecture Decision Record
- `/generate-agents` - Generate AGENTS.md standards file

### Additional Components (Full Install)

- `.ask/` folder with workflows and knowledge base
- MCP server configuration for enhanced AI capabilities
- Dev container setup with all required tools
- Project context template
- Documentation and tutorials

---

## Quick Start

### Installation

**Linux/Mac:**
```bash
# Full installation (recommended)
./scripts/install.sh --full

# Minimal installation (agents and prompts only)
./scripts/install.sh --agents-only

# Install to specific directory
./scripts/install.sh --full /path/to/your/project
```

**Windows:**
```powershell
# Full installation (recommended)
.\scripts\install.ps1 -Full

# Minimal installation
.\scripts\install.ps1 -AgentsOnly
```

### After Installation

1. **Read `GETTING-STARTED.md`** - Complete tutorial for new users
2. Open your project in VS Code
3. Open GitHub Copilot Chat (`Ctrl+Shift+I` or `Cmd+Shift+I`)
4. Type `@` to see available agents
5. Start with `@ask` and describe what you want to build

---

## Workflows

### Greenfield: Idea to Deployment

```
/prd → /frd → /plan → /implement → /deploy
```

1. `/prd` - Define your product vision
2. `/frd` - Break down into features
3. `/plan` - Create technical tasks
4. `/implement` - Write the code (TDD)
5. `/deploy` - Deploy to Azure

### Brownfield: Code to Documentation

```
/rev-eng → /modernize → /plan → /deploy
```

1. `/rev-eng` - Document existing code
2. `/modernize` - Plan improvements (optional)
3. `/plan` - Create implementation tasks
4. `/deploy` - Deploy updates

---

## Directory Structure

After installation:

```
your-project/
├── .github/
│   ├── agents/              # 10 AI agent definitions
│   └── prompts/             # 10 workflow commands
├── .ask/
│   ├── workflows/           # Step-by-step guides
│   ├── knowledge/           # TDD, testing best practices
│   └── templates/           # Project templates
├── .vscode/
│   └── mcp.json            # MCP configuration
├── .devcontainer/
│   └── devcontainer.json   # Dev container setup
├── specs/                   # Output directory
│   ├── features/           # Feature specs
│   ├── tasks/              # Technical tasks
│   ├── adr/                # Architecture decisions
│   └── docs/               # Documentation
├── project-context.md.template  # Customize for your project
├── GETTING-STARTED.md      # Tutorial for new users
└── docs/
    └── WORKFLOW-REFERENCE.md  # Complete reference
```

---

## Key Features

### Party Mode
Multi-agent collaborative discussions. Available from agent handoffs - brings multiple AI perspectives together.

### TDD Discipline
The dev agent follows strict Test-Driven Development:
1. RED - Write failing test
2. GREEN - Minimum code to pass
3. REFACTOR - Improve while green

### Project Context
Create `project-context.md` from template to give agents full project understanding.

### Knowledge Base
Best practices in `.ask/knowledge/`:
- TDD discipline
- Test quality guidelines
- Network-first patterns

---

## Configuration

### MCP Servers

Model Context Protocol servers provide enhanced capabilities:
- **context7** - Library documentation
- **github** - Repository management
- **microsoft.docs.mcp** - Microsoft/Azure docs
- **playwright** - Browser automation
- **deepwiki** - Repository context

### Dev Container

Pre-configured with:
- Python 3.12
- Node.js and TypeScript
- Azure CLI & Azure Developer CLI
- Docker-in-Docker
- VS Code extensions

---

## Examples

### Example 1: New Feature

```
You: "I want to build a quiz game about country flags"

@ask → Routes to @pm
@pm /prd → Creates PRD with game requirements
@pm /frd → Breaks into features (quiz, scoring, difficulty)
@planner /plan → Creates technical tasks
@dev /implement → Implements with TDD
@azure /deploy → Deploys to Azure
```

### Example 2: Document Legacy Code

```
You: "I inherited a Python app with no documentation"

@tech-analyst /rev-eng → Analyzes and documents codebase
@modernizer /modernize → Identifies upgrade opportunities
@dev /implement → Implements improvements
@azure /deploy → Deploys updates
```

---

## Documentation

| File | Purpose |
|------|---------|
| `GETTING-STARTED.md` | Complete tutorial for beginners |
| `docs/WORKFLOW-REFERENCE.md` | Detailed command reference |
| `.ask/workflows/` | Step-by-step workflow guides |
| `.ask/knowledge/` | Best practices and patterns |

---

## Troubleshooting

### Agents Not Showing
- Reload VS Code: `Ctrl+Shift+P` → "Reload Window"
- Verify `.github/agents/` folder exists

### Commands Not Working
- Check `.github/prompts/` folder
- Type `/` in Copilot Chat to see available commands

### Missing Context
- Create `project-context.md` from template
- Ensure `specs/prd.md` exists for technical agents

---

## Getting Help

- **Tutorial:** Read `GETTING-STARTED.md`
- **Reference:** Check `docs/WORKFLOW-REFERENCE.md`
- **Stuck?** Ask `@ask` to help

---

**Ready to start?** Read `GETTING-STARTED.md` and begin with `@ask`!

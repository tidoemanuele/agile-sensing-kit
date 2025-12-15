# ASK Project Instructions

This project uses **Agile Sensing Kit (ASK)** - an AI-powered development framework with persistent memory via Beads and agent coordination via Mail MCP.

## THE CARDINAL RULE

**Track work in Beads BEFORE writing code.**

Every code change must trace to a beads issue. No exceptions.

```bash
# Before ANY implementation
bd create --title="What you're doing" --type=task
bd update <id> --status=in_progress

# After completion
bd close <id>
bd sync
```

If you find yourself writing code without a corresponding beads issue, STOP. Create the issue first.

---

## HOW WORK FLOWS

**@ask is the orchestrator.** Complex requests route through @ask, which delegates to specialists:

| Request Type | Delegated To |
|--------------|--------------|
| Requirements, PRD, user stories | @pm (John) |
| Architecture decisions, ADRs | @architect (Winston) |
| Implementation planning | @planner |
| Code implementation | @dev (Amelia) |
| Test review, quality gates | @tea (Murat) |
| Azure deployment, IaC | @azure |

**Don't bypass the orchestrator for multi-step work.** Start with `@ask` and let it coordinate the right specialists.

For simple, single-domain tasks, you can go direct to the specialist agent.

---

## BEADS: YOUR MEMORY SYSTEM

Beads is the persistent memory layer. All agents share context through it.

### Essential Commands

```bash
bd ready                 # Find work ready to start (no blockers)
bd create --title="..." --type=task|bug|feature
bd show <id>             # View issue details + dependencies
bd update <id> --status=in_progress
bd close <id>            # Mark complete
bd sync                  # Push to git remote
```

### Dependency Tracking

```bash
bd dep add <issue> <depends-on>   # issue depends on depends-on
bd blocked                         # Show all blocked issues
bd dep tree <id>                   # Visualize dependency graph
```

### Session Workflow

1. **Start**: `bd ready` → pick an issue → `bd update <id> --status=in_progress`
2. **Work**: Implement with TDD discipline
3. **Complete**: `bd close <id>` → `bd sync`
4. **End session**: Always run `bd sync` before stopping

---

## AGENT MAIL: COORDINATION LAYER

When multiple agents work on the same project, use Mail MCP to coordinate.

### Session Registration

```
macro_start_session(
  human_key="/absolute/path/to/project",
  program="github-copilot",
  model="claude-sonnet-4.5"
)
```

### File Reservations (Prevent Conflicts)

```
file_reservation_paths(
  paths=["src/auth/*.ts"],
  exclusive=true,
  reason="Implementing auth feature"
)

# When done
release_file_reservations()
```

### Check Messages

```
fetch_inbox(agent_name="YourName")
```

**Note:** For single-agent sessions, Mail MCP is optional. Use it when coordinating across multiple agents or long-running tasks.

---

## TDD DISCIPLINE

All implementation follows red-green-refactor:
1. **RED**: Write failing test first
2. **GREEN**: Minimum code to pass
3. **REFACTOR**: Improve while green

See `.ask/knowledge/tdd-discipline.md` for enforcement details.

---

## QUICK REFERENCE

| Need To... | Do This |
|------------|---------|
| Start work | `bd ready` → pick issue → `bd update <id> --status=in_progress` |
| Track new work | `bd create --title="..." --type=task` |
| Finish work | `bd close <id>` → `bd sync` |
| Coordinate with agents | `macro_start_session()` → `fetch_inbox()` |
| Prevent file conflicts | `file_reservation_paths()` |

---

## LEARN MORE

- Agent definitions: `.github/agents/`
- Workflow prompts: `.github/prompts/`
- Knowledge base: `.ask/knowledge/`
- Full documentation: `README.md`

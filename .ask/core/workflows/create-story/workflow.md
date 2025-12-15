---
name: create-story
description: Creates well-formed user stories with acceptance criteria, estimates, and technical context via collaborative agent input
---

# Create Story Workflow

**Goal:** Create a complete, developer-ready user story with clear acceptance criteria and technical guidance.

**Your Role:** You are the Scrum Master (Bob) facilitating story creation with PM and technical input.

---

## AGENT MAIL INTEGRATION

**At story creation start**, gather experts:
```
macro_start_session(
  human_key="/path/to/project",
  program="github-copilot",
  model="claude-sonnet-4.5",
  agent_name="Bob"
)

send_message(
  to=["John", "Amelia", "Winston", "Murat"],
  subject="Story Creation: [brief title]",
  body_md="Creating new story for: [description]\n\nNeed input on:\n- Business value (John)\n- Technical approach (Winston)\n- Implementation (Amelia)\n- Testing (Murat)",
  thread_id="STORY-[timestamp]"
)
```

---

## PHASE 1: STORY DEFINITION

### User Story Format

**📋 John (PM):**
*"Let's start with the WHY. Who benefits and what value do they get?"*

```markdown
## User Story

**As a** [type of user]
**I want** [goal/desire]
**So that** [benefit/value]
```

### Value Validation
- **Business Impact:** [High/Medium/Low]
- **User Impact:** [High/Medium/Low]
- **Strategic Alignment:** [How it fits product goals]

---

## PHASE 2: ACCEPTANCE CRITERIA

### GIVEN-WHEN-THEN Format

**🏃 Bob (Scrum Master):**
*"What are the specific conditions for this story to be 'done'?"*

```markdown
## Acceptance Criteria

### AC-001: [Scenario name]
**Given** [precondition]
**When** [action]
**Then** [expected result]

### AC-002: [Scenario name]
**Given** [precondition]
**When** [action]
**Then** [expected result]
```

### Edge Cases

**🧪 Murat (TEA):**
*"Strong opinion: we need to cover these edge cases..."*

- [ ] Empty/null inputs
- [ ] Boundary conditions
- [ ] Error states
- [ ] Concurrent access (if applicable)

---

## PHASE 3: TECHNICAL CONTEXT

### Architecture Input

**🏗️ Winston (Architect):**
*"Here's the technical approach. Championing boring technology..."*

```markdown
## Technical Notes

**Affected Components:**
- [Component 1]: [changes needed]
- [Component 2]: [changes needed]

**Dependencies:**
- [External service/library]

**Architecture Decisions:**
- [Key decision and rationale]
```

### Implementation Guidance

**💻 Amelia (Dev):**
*"Implementation approach with file references..."*

```markdown
## Implementation Guide

**Files to Modify:**
- `src/[path]/[file].ts:[line]` - [change description]
- `src/[path]/[file].ts:[line]` - [change description]

**New Files:**
- `src/[path]/[newfile].ts` - [purpose]

**Patterns to Follow:**
- [Existing pattern reference]
```

---

## PHASE 4: ESTIMATION

### Story Points Discussion

**🏃 Bob (Scrum Master):**
*"Let's estimate. Consider complexity, effort, and uncertainty."*

| Factor | Assessment |
|--------|------------|
| Complexity | [1-5] |
| Effort | [1-5] |
| Uncertainty | [1-5] |

**Point Scale Reference:**
- **1 point:** Trivial, < 2 hours
- **2 points:** Small, half day
- **3 points:** Medium, 1 day
- **5 points:** Large, 2-3 days
- **8 points:** Very large, consider splitting
- **13 points:** Epic, must split

**Final Estimate:** __ points

### Risk Assessment

**🧪 Murat (TEA):**
*"Risk calculation for this story..."*

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | [H/M/L] | [H/M/L] | [Strategy] |

---

## PHASE 5: DEFINITION OF DONE

### Checklist

**🏃 Bob (Scrum Master):**
*"Standard Definition of Done plus story-specific items..."*

```markdown
## Definition of Done

- [ ] All AC scenarios pass
- [ ] Unit tests written (coverage ≥ 80%)
- [ ] Integration tests pass
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] No new tech debt introduced
- [ ] [Story-specific item]
```

---

## PHASE 6: FINALIZE

### Story Summary

```
send_message(
  to=["John", "Amelia", "Winston", "Murat"],
  subject="Story Ready: [ID] - [Title]",
  body_md="## Story Created\n\n**Title:** [title]\n**Points:** [estimate]\n**AC Count:** [N]\n\nReady for sprint planning.",
  thread_id="STORY-[timestamp]"
)
```

### Output Artifact

Save to `specs/stories/[story-id].md`:

```markdown
# [Story ID]: [Title]

## User Story
As a [user]
I want [goal]
So that [benefit]

## Acceptance Criteria
[AC list]

## Technical Notes
[Architecture and implementation guidance]

## Estimation
- **Points:** [N]
- **Complexity:** [assessment]
- **Risks:** [identified risks]

## Definition of Done
[Checklist]

---
**Created:** [date]
**Status:** Ready
**Sprint:** [Unassigned]
```

---

## EXIT CONDITIONS

Story creation ends when:
- User story is well-formed
- Acceptance criteria are complete
- Technical context is documented
- Estimate is agreed
- Definition of Done is clear

**🏃 Bob (Scrum Master):**
*"Story [ID] is ready for the backlog! All acceptance criteria documented, estimated at [X] points."*

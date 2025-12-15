---
name: course-correction
description: Handles mid-sprint changes, blockers, and scope adjustments with structured impact analysis and team alignment
---

# Course Correction Workflow

**Goal:** Address significant mid-sprint changes while maintaining team alignment and sprint integrity.

**Your Role:** You are the Scrum Master (Bob) facilitating urgent course corrections with minimal disruption.

---

## AGENT MAIL INTEGRATION

**At course correction trigger**, alert team:
```
macro_start_session(
  human_key="/path/to/project",
  program="github-copilot",
  model="claude-sonnet-4.5",
  agent_name="Bob"
)

send_message(
  to=["John", "Amelia", "Murat", "Winston"],
  subject="COURSE CORRECTION: [brief issue]",
  body_md="**Alert:** Mid-sprint course correction needed.\n\n**Trigger:** [what happened]\n**Impact:** [initial assessment]\n\nStandby for triage.",
  importance="urgent",
  thread_id="CORRECTION-[timestamp]"
)
```

---

## TRIGGER CONDITIONS

### When to Invoke

Course correction is needed when:
- **Blocker:** Critical dependency or technical blocker
- **Scope Change:** Stakeholder requests significant change
- **Discovery:** New information invalidates assumptions
- **Emergency:** Production issue requiring immediate attention
- **Capacity:** Team member unavailable (illness, emergency)

### Severity Assessment

| Severity | Criteria | Response Time |
|----------|----------|---------------|
| **Critical** | Sprint goal at risk | Immediate |
| **High** | Multiple stories affected | Same day |
| **Medium** | Single story impacted | Next standup |
| **Low** | Minor adjustment needed | Async |

---

## PHASE 1: TRIAGE

### Situation Assessment

**🏃 Bob (Scrum Master):**
*"Let's assess the situation quickly. What exactly happened and what's the blast radius?"*

```markdown
## Triage Report

**Trigger:** [What caused this]
**Discovered:** [When/how discovered]
**Severity:** [Critical/High/Medium/Low]

**Immediate Impact:**
- Stories affected: [list]
- Team members impacted: [list]
- Sprint goal status: [At risk/Salvageable/Unaffected]
```

### Stakeholder Input

**📋 John (PM):**
*"WHY is this happening now? What's the business impact of various responses?"*

- **Do Nothing:** [consequence]
- **Pivot:** [consequence]
- **Absorb:** [consequence]

---

## PHASE 2: IMPACT ANALYSIS

### Technical Assessment

**🏗️ Winston (Architect):**
*"Technical impact analysis. What's affected and what are our options?"*

```markdown
## Technical Impact

**Root Cause:** [What's actually broken/changed]

**Affected Systems:**
- [System 1]: [impact]
- [System 2]: [impact]

**Dependencies:**
- Upstream: [affected]
- Downstream: [affected]
```

### Implementation Impact

**💻 Amelia (Dev):**
*"Here's what this means for current work..."*

```markdown
## Work Impact

**In Progress:**
| Story | Status | Impact | Action Needed |
|-------|--------|--------|---------------|
| [ID] | [status] | [High/Med/Low] | [Continue/Pause/Pivot] |

**Blocked:**
- [Story ID]: blocked by [reason]

**Effort to Resolve:** [estimate]
```

### Quality Impact

**🧪 Murat (TEA):**
*"Quality and risk implications..."*

```markdown
## Quality Impact

**Testing Affected:**
- [Test suite/area]: [impact]

**Risk Increase:**
| New Risk | Likelihood | Impact |
|----------|------------|--------|
| [Risk] | [H/M/L] | [H/M/L] |

**Mitigation Required:** [Yes/No]
```

---

## PHASE 3: OPTIONS

### Response Options

**🏃 Bob (Scrum Master):**
*"Here are our options. Let's evaluate each..."*

---

**Option A: Absorb**
- Keep current sprint scope
- Add new work/address blocker
- Accept velocity hit

*Best when:* Impact is small, team has capacity buffer

---

**Option B: Swap**
- Remove lowest-priority story
- Replace with urgent work
- Maintain sprint commitment

*Best when:* Clear priority difference, similar effort

---

**Option C: Pivot**
- Revise sprint goal
- Re-plan remaining sprint
- Communicate to stakeholders

*Best when:* Fundamental assumption changed

---

**Option D: Escalate**
- Raise to leadership
- Request additional resources
- Extend timeline

*Best when:* Beyond team's ability to resolve

---

### Decision Matrix

| Option | Effort | Risk | Sprint Goal Impact | Recommendation |
|--------|--------|------|-------------------|----------------|
| Absorb | [H/M/L] | [H/M/L] | [impact] | |
| Swap | [H/M/L] | [H/M/L] | [impact] | |
| Pivot | [H/M/L] | [H/M/L] | [impact] | |
| Escalate | [H/M/L] | [H/M/L] | [impact] | |

---

## PHASE 4: DECISION

### Team Alignment

**🏃 Bob (Scrum Master):**
*"Based on analysis, I recommend [Option]. Team agreement?"*

**📋 John (PM):** *"[Agreement/Concern]"*
**💻 Amelia (Dev):** *"[Agreement/Concern]"*
**🧪 Murat (TEA):** *"[Agreement/Concern]"*
**🏗️ Winston (Architect):** *"[Agreement/Concern]"*

### Final Decision

```markdown
## Decision

**Selected Option:** [A/B/C/D]
**Rationale:** [Why this option]
**Dissent:** [Any disagreements noted]
```

---

## PHASE 5: EXECUTE

### Action Plan

**🏃 Bob (Scrum Master):**
*"Here's the action plan. Let's execute..."*

```markdown
## Action Plan

| Action | Owner | Due | Status |
|--------|-------|-----|--------|
| [Action 1] | [Agent] | [Time] | [ ] |
| [Action 2] | [Agent] | [Time] | [ ] |
| [Action 3] | [Agent] | [Time] | [ ] |
```

### Communication Plan

| Audience | Message | Owner | When |
|----------|---------|-------|------|
| Team | [what to communicate] | Bob | Immediate |
| Stakeholders | [what to communicate] | John | [time] |
| Leadership | [if needed] | [who] | [time] |

---

## PHASE 6: CLOSE

### Summary Message

```
send_message(
  to=["John", "Amelia", "Murat", "Winston"],
  subject="RESOLVED: [issue summary]",
  body_md="## Course Correction Complete\n\n**Trigger:** [what happened]\n**Decision:** [option chosen]\n**Actions:** [completed/in progress]\n\n**Updated Sprint Status:**\n- Goal: [status]\n- Velocity impact: [estimate]\n\nResume normal operations.",
  thread_id="CORRECTION-[timestamp]"
)
```

### Output Artifacts

Save to `specs/sprints/sprint-[N]/`:
- `course-correction-[date].md` - Full decision record

### Lessons Learned

```markdown
## Retrospective Note

**What Triggered This:**
[Root cause]

**How We Responded:**
[Summary]

**Prevention for Future:**
[What could prevent similar issues]
```

---

## EXIT CONDITIONS

Course correction ends when:
- Decision is made and communicated
- Action plan is executing
- Team is aligned
- Documentation is complete

**🏃 Bob (Scrum Master):**
*"Course correction complete. We've chosen to [decision] with [impact on sprint]. Back to work, team!"*

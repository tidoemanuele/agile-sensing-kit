# TDD Discipline

## The Red-Green-Refactor Cycle

Test-Driven Development is not optional. It is the discipline that ensures code quality and prevents regression.

### The Cycle

```
┌─────────────────────────────────────────┐
│                                         │
│   1. RED: Write failing test first      │
│      ↓                                  │
│   2. GREEN: Minimum code to pass        │
│      ↓                                  │
│   3. REFACTOR: Improve while green      │
│      ↓                                  │
│   (Repeat)                              │
│                                         │
└─────────────────────────────────────────┘
```

## Critical Rules

### NEVER Lie About Tests

- Tests must actually exist
- Tests must actually pass (100%)
- Tests must actually cover the acceptance criteria
- No "I wrote tests" without running them

### Story File is Single Source of Truth

- Tasks/subtasks sequence is authoritative
- Execute IN ORDER as written
- No skipping, no reordering
- Mark complete ONLY when implementation AND tests pass

### All Existing Tests Must Pass

- Run full test suite after each task
- NEVER proceed with failing tests
- Fix regressions immediately

## Implementation Pattern

### Step 1: RED - Write Failing Test

```typescript
// Write test FIRST - it should fail
describe('UserService', () => {
  it('should create user with valid email', async () => {
    const service = new UserService();
    const user = await service.create({ email: 'test@example.com' });

    expect(user.id).toBeTruthy();
    expect(user.email).toBe('test@example.com');
    expect(user.createdAt).toBeTruthy();
  });
});

// Run test - MUST FAIL
// ❌ ReferenceError: UserService is not defined
```

### Step 2: GREEN - Minimum Code to Pass

```typescript
// Write MINIMUM code to make test pass
class UserService {
  async create(data: { email: string }) {
    return {
      id: crypto.randomUUID(),
      email: data.email,
      createdAt: new Date(),
    };
  }
}

// Run test - MUST PASS
// ✅ 1 passing
```

### Step 3: REFACTOR - Improve While Green

```typescript
// Improve code quality, keeping tests green
class UserService {
  constructor(private readonly db: Database) {}

  async create(data: CreateUserDto): Promise<User> {
    const user = User.create(data);
    await this.db.users.insert(user);
    return user;
  }
}

// Run test - MUST STILL PASS
// ✅ 1 passing
```

## Task Completion Criteria

A task is complete ONLY when:

1. ✅ Test written and initially fails (RED)
2. ✅ Implementation makes test pass (GREEN)
3. ✅ Code refactored for quality (REFACTOR)
4. ✅ All existing tests still pass
5. ✅ Coverage meets minimum (85%)
6. ✅ Task marked `[x]` in story file

## Common Violations

| Violation | Why It's Wrong | Correct Approach |
|-----------|----------------|------------------|
| Writing implementation first | No test validation | Write test first |
| Skipping RED phase | Test might always pass | Verify test fails first |
| Not running all tests | Hidden regressions | Full suite after each task |
| "Tests work on my machine" | Environment issues | CI must pass |
| Marking complete without tests | No quality assurance | Tests required |

## Dev Agent Enforcement

The Dev agent (Amelia) enforces TDD discipline:

```
<step n="7">For each task/subtask: follow red-green-refactor cycle - write failing test first, then implementation</step>
<step n="9">Run full test suite after each task - NEVER proceed with failing tests</step>
<step n="13">NEVER lie about tests being written or passing - tests must actually exist and pass 100%</step>
```

## Integration Points

- **Used by**: Dev agent, TEA agent, code-review workflow
- **Related knowledge**: `test-quality.md`, `fixture-architecture.md`

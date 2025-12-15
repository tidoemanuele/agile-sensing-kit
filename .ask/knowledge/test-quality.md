# Test Quality Definition of Done

## Principle

Tests must be deterministic, isolated, explicit, focused, and fast. Every test should execute in under 1.5 minutes, contain fewer than 300 lines, avoid hard waits and conditionals, keep assertions visible in test bodies, and clean up after itself for parallel execution.

## Core Quality Checklist

Every test must pass these criteria:

- [ ] **No Hard Waits** - Use `waitForResponse`, `waitForLoadState`, or element state (not `waitForTimeout`)
- [ ] **No Conditionals** - Tests execute the same path every time (no if/else, try/catch for flow control)
- [ ] **< 300 Lines** - Keep tests focused; split large tests or extract setup to fixtures
- [ ] **< 1.5 Minutes** - Optimize with API setup, parallel operations, and shared auth
- [ ] **Self-Cleaning** - Use fixtures with auto-cleanup or explicit `afterEach()` teardown
- [ ] **Explicit Assertions** - Keep `expect()` calls in test bodies, not hidden in helpers
- [ ] **Unique Data** - Use `faker` for dynamic data; never hardcode IDs or emails
- [ ] **Parallel-Safe** - Tests don't share state; run successfully with `--workers=4`

## Rationale

Quality tests provide reliable signal about application health. Flaky tests erode confidence and waste engineering time.

### Anti-patterns to Avoid

| Anti-pattern | Why It's Bad | Better Approach |
|--------------|--------------|-----------------|
| `waitForTimeout(3000)` | Non-deterministic, slow | `waitForResponse()` |
| `if (element.isVisible())` | Test behavior varies | Ensure predictable state |
| `try { ... } catch { }` | Hides real issues | Let failures bubble |
| `Math.random()` | Non-reproducible | Factory with seed |
| Hidden assertions in helpers | Obscures test intent | Keep in test body |
| 500+ line tests | Hard to debug | Split into focused tests |

## Pattern Examples

### Deterministic Test

```typescript
// ❌ BAD: Non-deterministic
test('flaky test', async ({ page }) => {
  await page.goto('/dashboard');
  await page.waitForTimeout(3000); // NEVER

  if (await page.locator('[data-testid="banner"]').isVisible()) {
    await page.click('[data-testid="dismiss"]');
  }
});

// ✅ GOOD: Deterministic with explicit waits
test('reliable test', async ({ page, apiRequest }) => {
  const user = createUser({ hasSeenWelcome: true });
  await apiRequest.post('/api/users', { data: user });

  const dashboardPromise = page.waitForResponse('**/api/dashboard');
  await page.goto('/dashboard');
  await dashboardPromise;

  await expect(page.getByText(`Welcome, ${user.name}`)).toBeVisible();
});
```

### Self-Cleaning Test

```typescript
// ✅ Fixture with auto-cleanup
export const test = base.extend({
  seedUser: async ({}, use) => {
    const createdUsers: string[] = [];

    const seedUser = async (data: Partial<User>) => {
      const user = await seedDatabase('users', data);
      createdUsers.push(user.id);
      return user;
    };

    await use(seedUser);

    // Auto-cleanup after test
    for (const id of createdUsers) {
      await deleteRecord('users', id);
    }
  },
});
```

## Integration Points

- **Used in workflows**: `*atdd`, `*automate`, `*test-review`
- **Related knowledge**: `network-first.md`, `data-factories.md`, `fixture-architecture.md`

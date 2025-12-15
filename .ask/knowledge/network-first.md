# Network-First Testing Pattern

## Principle

Intercept network requests BEFORE navigation, not after. This eliminates race conditions where responses arrive before interception is set up.

## The Pattern

```
1. Set up interception (waitForResponse / cy.intercept)
2. Trigger the action (navigation, click, etc.)
3. Wait for the intercepted response
4. Make assertions based on actual response data
```

## Why Network-First?

### Race Condition Problem

```typescript
// ❌ BAD: Race condition - response may arrive before interception
await page.goto('/dashboard');
const response = await page.waitForResponse('**/api/data'); // Too late!
```

### Network-First Solution

```typescript
// ✅ GOOD: Interception ready before navigation
const responsePromise = page.waitForResponse('**/api/data');
await page.goto('/dashboard');
const response = await responsePromise; // Guaranteed to catch
```

## Implementation Examples

### Playwright

```typescript
test('dashboard loads user data', async ({ page }) => {
  // 1. Set up interception FIRST
  const dashboardPromise = page.waitForResponse(
    (resp) => resp.url().includes('/api/dashboard') && resp.status() === 200
  );

  // 2. Then navigate
  await page.goto('/dashboard');

  // 3. Wait for intercepted response
  const response = await dashboardPromise;
  const data = await response.json();

  // 4. Assert based on actual data
  await expect(page.getByTestId('items')).toHaveCount(data.items.length);
});
```

### Cypress

```typescript
describe('Dashboard', () => {
  it('loads user data', () => {
    // 1. Set up interception FIRST
    cy.intercept('GET', '**/api/dashboard').as('getDashboard');

    // 2. Then navigate
    cy.visit('/dashboard');

    // 3. Wait for intercepted response
    cy.wait('@getDashboard').then((interception) => {
      const data = interception.response.body;

      // 4. Assert based on actual data
      cy.get('[data-cy="items"]').should('have.length', data.items.length);
    });
  });
});
```

## Advanced Patterns

### Multiple Requests

```typescript
// Intercept multiple requests in parallel
const [usersPromise, settingsPromise] = [
  page.waitForResponse('**/api/users'),
  page.waitForResponse('**/api/settings'),
];

await page.goto('/admin');

const [usersResponse, settingsResponse] = await Promise.all([
  usersPromise,
  settingsPromise,
]);
```

### Request Modification

```typescript
// Modify request/response for testing edge cases
await page.route('**/api/users', async (route) => {
  await route.fulfill({
    status: 500,
    body: JSON.stringify({ error: 'Server error' }),
  });
});

await page.goto('/users');
await expect(page.getByText('Failed to load users')).toBeVisible();
```

### Waiting for Specific Conditions

```typescript
// Wait for response with specific content
const responsePromise = page.waitForResponse(
  (resp) =>
    resp.url().includes('/api/search') &&
    resp.status() === 200 &&
    resp.json().then(data => data.results.length > 0)
);
```

## Common Mistakes

| Mistake | Problem | Fix |
|---------|---------|-----|
| Intercept after action | Race condition | Intercept first |
| Using `waitForTimeout` | Non-deterministic | Use `waitForResponse` |
| Not checking status | Missing errors | Check `resp.status()` |
| Ignoring response data | Missing validation | Assert with actual data |

## Replaces Anti-patterns

```typescript
// ❌ NEVER: Arbitrary wait
await page.waitForTimeout(3000);

// ❌ NEVER: Polling for element
while (!await page.locator('.data').isVisible()) {
  await page.waitForTimeout(100);
}

// ✅ ALWAYS: Network-first
const dataPromise = page.waitForResponse('**/api/data');
await page.click('[data-testid="load"]');
await dataPromise;
await expect(page.locator('.data')).toBeVisible();
```

## Integration Points

- **Used by**: E2E tests, integration tests, API tests
- **Related knowledge**: `test-quality.md`, `intercept-network-call.md`

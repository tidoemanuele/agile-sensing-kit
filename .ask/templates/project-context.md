# Project Context

> **The Bible**: This document is the authoritative source of truth for all agents working on this project. When in doubt, follow this context.

---

## Project Overview

**Project Name:** {project_name}
**Description:** {brief description}
**Repository:** {repo URL}
**Tech Stack:** {primary technologies}

---

## Architecture Decisions

### Technology Choices

| Layer | Technology | Rationale |
|-------|------------|-----------|
| Frontend | | |
| Backend | | |
| Database | | |
| Hosting | | |

### Key Patterns

- {Pattern 1}: {why it's used}
- {Pattern 2}: {why it's used}

---

## Coding Standards

### General

- **Language:** {primary language(s)}
- **Style Guide:** {link or reference}
- **Test Coverage:** Minimum 85%

### Naming Conventions

- **Files:** kebab-case
- **Components:** PascalCase
- **Functions:** camelCase
- **Constants:** UPPER_SNAKE_CASE

### File Structure

```
src/
├── components/     # UI components
├── services/       # Business logic
├── utils/          # Utility functions
├── types/          # TypeScript types
└── tests/          # Test files
```

---

## Development Workflow

### Branch Strategy

- `main` - Production
- `develop` - Integration
- `feature/*` - Feature branches
- `fix/*` - Bug fixes

### Commit Messages

Follow conventional commits:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `refactor:` Code refactoring
- `test:` Test additions

### Pull Request Process

1. Create feature branch
2. Implement with tests (TDD)
3. Run full test suite
4. Create PR with description
5. Code review required
6. Merge to develop

---

## Testing Strategy

### Test Pyramid

- **Unit Tests:** 70% - Fast, isolated
- **Integration Tests:** 20% - API/service boundaries
- **E2E Tests:** 10% - Critical user journeys

### TDD Discipline

1. **RED:** Write failing test first
2. **GREEN:** Minimum code to pass
3. **REFACTOR:** Improve while green

### Quality Gates

- All tests pass (100%)
- Coverage >= 85%
- No critical security issues
- Performance benchmarks met

---

## Security Requirements

### Authentication

- {Method: OAuth/JWT/Session}
- {Provider if applicable}

### Authorization

- {RBAC/ABAC/Custom}
- {Role definitions}

### Data Protection

- Encryption at rest: {yes/no}
- Encryption in transit: {TLS version}
- PII handling: {approach}

---

## Deployment

### Environments

| Environment | URL | Purpose |
|-------------|-----|---------|
| Development | | Local/feature testing |
| Staging | | Pre-production validation |
| Production | | Live users |

### CI/CD Pipeline

1. Build
2. Test (unit + integration)
3. Security scan
4. Deploy to staging
5. E2E tests
6. Deploy to production

---

## Team & Communication

### Key Contacts

| Role | Name | Contact |
|------|------|---------|
| Product Owner | | |
| Tech Lead | | |
| DevOps | | |

### Communication Channels

- Daily standup: {time/location}
- Sprint planning: {schedule}
- Retrospective: {schedule}

---

## Known Constraints

### Technical Debt

- {Item 1}: {impact and plan}
- {Item 2}: {impact and plan}

### External Dependencies

- {Service/API}: {version, SLA}

### Timeline Pressures

- {Milestone}: {date, impact}

---

*Last Updated: {date}*
*Maintained by: {team/person}*

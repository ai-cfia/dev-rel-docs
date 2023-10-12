# ADR 1: Adopting Architecture Decision Records (ADRs)

## Status

Accepted

## Context

AI-Lab has been facing challenges in maintaining a clear and understandable history of architectural decisions. As the team grows and the codebase expands, it becomes increasingly difficult to keep track of decisions made and the rationale behind them. This lack of documentation has led to:

- Repeated discussions about previously made decisions
- Difficulty in onboarding new team members
- Inconsistent architectural approaches across different parts of the project

## Decision

We will adopt Architecture Decision Records (ADRs) to capture important architectural decisions for all our projects.

### Format

- **File Naming**: ADRs will follow the naming convention `NNN-tag.md`, for example, `001-ailab-using-adr.md`.
  - `NNN`: A three-digit number to ensure ADRs are listed in numerical order.
  - `tag`: A descriptive tag of the decision.
- **Content**: ADRs will be in Markdown format.
- **Sections**: Each ADR will include Status, Context, Decision, Consequences, and optionally, References.

### Storage

- ADRs will be stored in a dedicated directory within this [repository](https://github.com/ai-cfia/dev-rel-docs), under `adr/`.
  
### Review and Update Process

- New ADRs will be proposed through issues and pull requests, allowing for team review and discussion.
- ADR history will be managed through GitHub's version history.

## Consequences

- All significant architectural decisions will be documented, making it easier to understand the history and current state of the system.
- New team members can easily get up to speed by reviewing the ADR's version history.
- ADRs will serve as a point of reference for future architectural decisions, reducing the need for repeated discussions.




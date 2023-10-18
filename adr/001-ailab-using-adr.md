# ADR 1: Adopting Architecture Decision Records (ADRs)

## Executive Summary

This ADR establishes the use of ADRs within AI-Lab at Canadian Food Inspection
Agency (CFIA) for documenting key architectural decisions. An ADR is a document
designed to capture decisions across multiple projects and products and are of
such significance that they require uniform compliance from all teams involved.
We chose ADRs for their version-controlled, clear, and accessible format,
addressing issues such as repeated discussions, inconsistent approaches, and
difficulties in onboarding. The document sets the standards for ADR creation,
storage, and modification.

## Context

AI-Lab, comprised of software developers and data scientists, is dedicated to
leveraging AI technologies to address a range of challenges, both within the
organization and in external engagements. As the team and its projects have
grown, challenges have arisen in maintaining a clear and understandable history
of architectural decisions. These challenges include:

- Repeated discussions about previously made decisions: The lack of a formalized
  decision-making process means that decisions are often revisited, causing
  wasted time and effort.
- Difficulty in onboarding new team members: The absence of a single, definitive
  source for architectural decisions complicates the onboarding process.
- Inconsistent architectural approaches: Different projects or project parts
  sometimes adopt varying approaches, leading to long-term maintainability
  issues.

These challenges have led the team to explore various solutions for maintaining
a more coherent, version-controlled, and accessible record of significant
architectural decisions.

### Alternatives Considered

#### Architecture Decision Records (ADRs)

Pros:

- Provides a version-controlled history of decisions, aligning well with the
  team's need for traceability.
- Facilitates quick onboarding by offering a single source of truth for
  architectural decisions.
- Promotes consistency across projects by documenting decisions and their
  rationales.

Cons:

- Introduces the challenge of ensuring that all team members actively contribute
  to and read ADRs.
- Additional time needed to write, review, and maintain ADRs can slow down the
  initial phases of projects.
- Requires ongoing discipline to maintain and update records.

#### Continuing with Wiki-based Documentation

A Wiki is a platform that allows collaborative editing of content. Generally
used for internal documentation, FAQs, and quick guidelines. We've been using
a wiki so far.

Pros:

- Quick and simple to update.
- No additional tools required.

Cons:

- Lacks version control, leading to potential confusion.
- Prone to becoming outdated.
- Inadequate for tracking decision history.

#### Request for Comments (RFC)

Pros:

- Facilitates team-wide discussions for decision-making.
- Formalizes the decision-making process.

Cons:

- Consumes significant time for discussion and approval.
- Formal process may deter contributions from less experienced team members.

#### Confluence

Pros:

- Supports rich text and multimedia for comprehensive documentation.
- Integrates well with other tools like Jira.

Cons:

- Additional cost for licenses.
- Complexity can lead to disorganization.

#### Decision Log

Pros:

- Simple, low-tech solution.
- Easy to maintain and update.
- Can be integrated into existing project management tools.

Cons:

- May lack detailed context and rationale behind decisions.
- Not inherently version-controlled.
- Could become disorganized if not maintained properly.

## Decision

After evaluating these options, ADRs emerged as the best solution for
maintaining a version-controlled, easily accessible record of architectural
decisions. Each ADR will explain the reasoning, background, and consequences of
important architectural choices, like opting for a certain database or
committing to a specific architectural framework, not trivial decisions.

#### Example of decisions that could be addressed by ADR

- Which database engine should we use and why?
- Should we move to a microservices architecture?
- What authentication strategy should we adopt?
- How will we handle API versioning?
- What approach will we take for caching?
- Which cloud provider should we use?
- What logging and monitoring solutions will be adopted?
- Should we use containers for deployment, and if so, which orchestration tool?
- Which message broker to use for asynchronous operations?
- What is our strategy for data backup and recovery?

#### Example of decisions that should not be addressed by ADR

- What color should the login button be?
- How do we implement a specific function in code?
- What are the specific firewall rules?
- What specific libraries to use for string manipulation?
- Which individual UI components to use?
- Setting up environment variables for local development.
- Pagination limits for lists and tables.
- Algorithm to use for a single, specific task.

### Format

- File Naming: ADRs will follow the naming convention `NNN-tag.md`, for example,
  `001-ailab-using-adr.md`.
  - `NNN`: A three-digit number to ensure ADRs are listed in numerical order.
  - `tag`: A descriptive tag of the decision.
- Sections will include: Abstract, Context, Decision, Consequences and
  References.

### Implicit Statuses

- PROPOSED: ADRs or modifications proposed via active pull requests and placed
  in the `adr/` folder.
- ACCEPTED: ADRs merged in the main branch.
- REJECTED: Pull requests that have been rejected or issues that led to a
  decision not to proceed.
- DEPRECATED: ADRs moved to the `adr/archives/` folder, indicating the decision
  is void.
- SUPERSEDED: ADRs replaced by a new one and moved to `adr/archives/`, retaining
  their original tag but assigned a new number.
- MODIFIED: Minor changes to an existing ADR, retaining its original number and
  tag.

### Storage

- ADRs will be stored in a dedicated directory within this
  [repository](https://github.com/ai-cfia/dev-rel-docs), under the folder
  `adr/`.
- Deprecated and superseded ADRs will be moved to `adr/archives/`.

### Review and Update Process

- New ADRs and modifications will be proposed through issues and pull requests.
- Must be approved by the whole team before merging.

#### Example: Superseding an ADR

1. Start by creating a GitHub issue to discuss the need for major changes in the
   existing ADR. Include all the team.
2. Once there's agreement, create a new branch for the changes.
   - In the new branch, create a new ADR with a new number but retain the
     original tag. This new ADR should reference the old one.
   - Update the old ADR to reference the new one and prepare it to be moved to
     `adr/archives/`.
   - Update the [index](./index.md).
   - Submit these changes as a pull request from the new branch, linking it to
     the original GitHub issue for context.
3. Once the pull request is approved by the whole team, merge it.

## Consequences

- All significant architectural decisions will be documented, making it easier
  to understand the history and current state of the system.
- New team members can get up to speed by reviewing the ADRs based on their
  subject tags and by consulting the version history for context.
- ADRs will serve as a point of reference for future architectural decisions,
  reducing the need for repeated discussions.
- This ADR will be reviewed periodically to assess its outcomes.

## References

- [Architecture decision record
  (ADR)](https://github.com/joelparkerhenderson/architecture-decision-record) -
  Joel Parker Henderson
- [Decision record
  template](https://github.com/joelparkerhenderson/architecture-decision-record/blob/main/templates/decision-record-template-by-michael-nygard/index.md) - Mychael Nygard
- [Communicating and documenting architectural
  decisions](https://www.youtube.com/watch?v=rwfXkSjFhzc) - David Ayers
- [A Structured RFC
  Process](https://philcalcado.com/2018/11/19/a_structured_rfc_process.html) -
  Phil Calçado
- [DACI: decision
  documentation](https://www.atlassian.com/software/confluence/templates/decision) - Atlassian Confluence
- [How to use a project decision log for optimal
  results](https://monday.com/blog/project-management/decision-log/) -
  Monday.com


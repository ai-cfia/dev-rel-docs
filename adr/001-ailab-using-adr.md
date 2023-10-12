# ADR 1: Adopting Architecture Decision Records (ADRs)

## Context

AI-Lab, comprised of developers and data scientists at CFIA, is dedicated to leveraging AI technologies to address a range of challenges, both within the organization and in external engagements. As the team and its projects have grown, challenges have arisen in maintaining a clear and understandable history of architectural decisions. These challenges include:

- Repeated discussions about previously made decisions
- Difficulty in onboarding new team members
- Inconsistent architectural approaches across different parts of the project

### Solutions Considered

#### Continuing with Wiki-based Documentation

Pros:

- Quick and simple to update
- No additional tools required

Cons:

- Lacks version control, leading to potential confusion
- Prone to becoming outdated
- Inadequate for tracking decision history

#### Request for Comments (RFC)

Pros:

- Facilitates team-wide discussions for decision-making
- Formalizes the decision-making process

Cons:

- Consumes significant time for discussion and approval
- Formal process may deter contributions from less experienced team members

#### Confluence

Pros:

- Supports rich text and multimedia for comprehensive documentation
- Integrates well with other tools like Jira

Cons:

- Additional cost for licenses
- Complexity can lead to disorganization

#### Decision Log

Pros:

- Simple, low-tech solution
- Easy to maintain and update
- Can be integrated into existing project management tools

Cons:

- May lack detailed context and rationale behind decisions
- Not inherently version-controlled
- Could become disorganized if not maintained properly

#### Architecture Decision Records (ADRs)

Pros:

- Provides a version-controlled history of decisions, aligning well with the team's need for traceability
- Facilitates quick onboarding by offering a single source of truth for architectural decisions
- Promotes consistency across projects by documenting decisions and their rationales

Cons:

- Requires the initial overhead of setting up a version control system
- Could be considered over-engineered for very small or short-term projects
- Requires ongoing discipline to maintain and update records


## Decision

After evaluating these options, ADRs emerged as the best solution for maintaining a version-controlled, easily accessible record of architectural decisions.

ADRs should contain the rationale, context, and implications of significant architectural decisions, such as choosing a database or adopting a particular architectural pattern like microservices. They should not be about trivial details such as specific code snippets.

### Format

- File Naming: ADRs will follow the naming convention `NNN-tag.md`, for example, `001-ailab-using-adr.md`.
  - `NNN`: A three-digit number to ensure ADRs are listed in numerical order.
  - `tag`: A descriptive tag of the decision.
- Sections will include: Context, Decision, Consequences and References.

### Implicit Statuses

- Proposed: ADRs or modifications proposed via active pull requests and placed in the `adr/` folder.
- Accepted: ADRs merged in the main branch.
- Rejected: Pull requests that have been rejected or issues that led to a decision not to proceed.
- Deprecated: ADRs moved to the `adr/archives/` folder, indicating the decision is void.
- Superseded: ADRs replaced by a new one and moved to `adr/archives/`, retaining their original tag but assigned a new number.
- Modified: Minor changes to an existing ADR, retaining its original number and tag.

### Storage

- ADRs will be stored in a dedicated directory within this [repository](https://github.com/ai-cfia/dev-rel-docs), under the folder `adr/`.
- Deprecated and superseded ADRs will be moved to `adr/archives/`.

### Review and Update Process

- New ADRs and modifications will be proposed through issues and pull requests.
- Must be approved by the whole team before merging.

#### Example: Superseding an ADR

1. Start by creating a GitHub issue to discuss the need for major changes in the existing ADR. Include all the team.
2. Once there's agreement, create a new branch for the changes.
3. In the new branch, create a new ADR with a new number but retain the original tag. This new ADR should reference the old one.
4. Update the old ADR to reference the new one and prepare it to be moved to `adr/archives/`.
5. Update the [index](./index.md).
6. Submit these changes as a pull request from the new branch, linking it to the original GitHub issue for context.
7. Once the pull request is approved by the whole team, merge it.

## Consequences

- All significant architectural decisions will be documented, making it easier to understand the history and current state of the system.
- New team members can get up to speed by reviewing the ADRs based on their subject tags and by consulting the version history for context.
- ADRs will serve as a point of reference for future architectural decisions, reducing the need for repeated discussions.


## References
- [Communicating and documenting architectural decisions](https://www.youtube.com/watch?v=rwfXkSjFhzc) - David Ayers
- [A Structured RFC Process](https://philcalcado.com/2018/11/19/a_structured_rfc_process.html) - Phil Calçado
- [DACI: decision documentation](https://www.atlassian.com/software/confluence/templates/decision) - Atlassian Confluence
- [How to use a project decision log for optimal results](https://monday.com/blog/project-management/decision-log/) - Monday.com

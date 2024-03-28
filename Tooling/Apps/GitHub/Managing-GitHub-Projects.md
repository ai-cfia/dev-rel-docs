# Managing GitHub Projects

This guide intends to help in creating and managing GitHub projects in a way
that's clear and understandable for our team, managers, and clients. It focuses
on ensuring tasks are visible and prioritized, leading to organized and
efficient project management. It extends this
[guideline](https://github.com/ai-cfia/.github/blob/main/profile/CONTRIBUTING.md#working-with-github-projects).

## Setting Up a GitHub Project

For setting up a new project, follow the instructions provided in the GitHub
documentation: [Creating a Project
Board](https://docs.github.com/en/issues/organizing-your-work-with-project-boards/managing-project-boards/creating-a-project-board#creating-an-organization-wide-classic-project).
Typically, your supervisor or manager will handle the creation of new projects.

## Managing Issues and Tasks

This section details how we handle issues and tasks within our GitHub projects.

### Project Views

A project should include all related issues from connected repositories.
Ideally, it should not track PRs.

- The default view should be a table sorted by priority, showing issues marked
  as 'Todo' or 'In Progress' (filter: `status:Todo,"In Progress"`). It should
  show relevant issues that give a good idea of project's status.
- A second table view serves as our backlog, filtering out tasks marked as
  'Todo', 'In Progress', or 'Done' (filter: `-status:Todo,"In Progress",Done`).
- We also maintain at least one board view for status tracking and a Roadmap
  view for temporal tracking.

Views can be customized as needed.

For more insights, watch these videos:

- [Plan and Track Projects Close to Your Code
  #DemoDays](https://www.youtube.com/watch?v=SI1ra-XHWHM)
- [Learn How to Use Project Roadmaps - GitHub
  Checkout](https://www.youtube.com/watch?v=D80u__nYYWw)

### Creating Issues

Create issues directly from the GitHub projects, preferably in the backlog view.
A good starting point is the GitHub guide [About
Issues](https://docs.github.com/en/issues/tracking-your-work-with-issues/about-issues).
Follow our internal guidelines for creating an issue, available
[here](https://github.com/ai-cfia/.github/blob/main/profile/CONTRIBUTING.md#filing-an-issueticket).

### Prioritizing Issues

We should prioritize issues at least weekly and maintain clean boards. In the
priority table view, adjust issue order by dragging rows. It's possible to group
items by milestones while keeping priority order within each group.

### Labeling Issues

- **Creating Labels:** Usually, use existing labels. If an important one is
  missing, consult your supervisor or manager before creating it.
- **Using Labels:** Key labels include 'user-visible' for tasks directly
  impacting users (urgent) and 'good first issue' for simpler tasks suitable for
  new interns. Use other labels sparingly.

---

Based on comments from the team meeting "Issues and Projects cleaning up" on
Friday 2023-12-08.

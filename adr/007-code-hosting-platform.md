# ADR 7 : Selecting GitHub as Code Hosting Platform

## Executive Summary
This ADR documents the decision to select GitHub as the primary platform for hosting, managing, and sharing code within our agency.

## Context
A choice needed to be made to be able to manage and share code. It needed to be an online platform so that team members could work together in real time from anywhere in the country as well as allow access to external developers all around the world. Since the agency takes an open source approach, it means it's important to have the ability for everyone to be able to see the projects being worked on. It was important to pick a platform that would help organize and review the code.

## Decision
In light of the open source mindset of the agency, GitHub clearly stood out from the rest of the options available for a couple reasons :

* Community and Open-Source Focus
    * GitHub has a more prominent community of developers and is better suited for open-source code development and open-source projects. It's a platform where programmers from around the world collaborate on projects, often with varying levels of knowledge and commitment.

* Version Control
    * GitHub’s interface and workflow are considered intuitive, especially for open-source developers.

* Pipeline Automation with GitHub Actions
    * Reusable Workflows: The GitHub Marketplace provides a platform for developers to share and reuse workflows, reducing the need to recreate common workflow configurations. This is especially useful for common tasks and standard processes across projects.

    * Extensive Integration: It offers a range of third-party integrations and actions that can extend the capabilities of your projects on GitHub. You can find tools for monitoring, testing, deploying, and more.

    * Community-Driven: The marketplace is community-driven, meaning developers can contribute their own actions and workflows, making it a rich ecosystem of tools and automation processes. This is particularly beneficial for open-source projects, as it fosters collaboration and sharing of resources.


## Alternatives Considered

### Alternative 1: GitLab
Pros:
- Workflow Tools: Suite of tools for team collaboration.
- DevSecOps Platform: Supports teams in software development.

Cons:
- Interface Navigation can be challenging, especially for new users.
- Issue Tracking Customization is limited for some users.
- CI/Automation integration

### Alternative 2: Azure DevOps
Pros:
- Good at managing and securing git repositories.

- Flexible and powerful set supporting agile and DevOps.

- Allows efficient build, commit, and deployment of code.

Cons:
- Mainly suited for developers.

- Less prominent open-source community compared to GitHub.

### Alternative 3: Bitbucket
Pros:
- Easy collaboration with public/private repositories.

- Seamless management of repositories, branches, and pull requests.

Cons:
- Challenging with external tools or platforms.
- Feature limitations and less community-driven.
- No built-in Continuous Integration/Continuous Deployment capabilities.

## Consequences

The decision to use GitHub will help the agency's reach; it will get more people to look at the products and support the open source goals. It will also make DevOps a lot easier with its large community marketplace for workflow. It will also help developers be more productive and improve their work. That being said, the agency has two computer science teams and one team works with GitHub and the other with Azure DevOps, which could lead to some complications.

## References
[GetApp - GitLab Reviews](https://www.getapp.com/it-management-software/a/gitlab/reviews/#:~:text=Pros.%20Its%20intuitive%20interface%20and%20robust%20feature%20set,challenging%20for%20new%20users%20to%20get%20started.%20IR)

[TrustRadius - Pros and Cons of GitLab 2023](https://www.trustradius.com/products/gitlab/reviews)

[Vince The IT Guy - Pros and Cons for Using GitLab](https://vincetheitguy.com/gitlab-pros-and-cons/)

[Capiche - GitLab Pros and Cons](https://capiche.com/q/gitlab-pros-and-cons)

[TrustRadius - Azure DevOps Services Reviews](https://www.trustradius.com/products/azure-devops-services/reviews?qs=pros-and-cons)

[Software Advice - Azure DevOps Services Software Reviews, Pros and Cons - 2023](https://www.softwareadvice.com/devops/azure-devops-profile/reviews/)

[Dev.to - Azure DevOps vs GitHub: Which Toolstack Is Better for Software Teams?](https://dev.to/devteams/azure-devops-vs-github-which-toolstack-is-better-for-software-teams)

[StackShare - Reviews, Pros & Cons | Companies using Azure DevOps](https://stackshare.io/azure-devops)

[TrustRadius - Pros and Cons of Bitbucket 2023](https://www.trustradius.com/products/bitbucket/reviews)

[Sysgeeker - Bitbucket Review - Streamline Your Code Collaboration Effortlessly](https://www.sysgeeker.com/bitbucket-review.html)

[CompareCamp - BitBucket Review: Pricing, Pros, Cons & Features](https://comparecamp.com/bitbucket-review-pricing-pros-cons-features/)

[Capterra - Bitbucket Reviews 2023](https://www.capterra.com/p/166497/Bitbucket/reviews/)

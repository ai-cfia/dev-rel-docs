# ADR-007: Selecting GitHub as Code Hosting Platform

## Executive Summary
This ADR documents the decision to select GitHub as the primary platform for hosting, managing, and sharing code within the CFIA's (Canadian Food Inspection Agency) AI (Artificial Intelligence) Lab.

## Context
The team needs a platform to be able to manage and share code which needed to be an online platform so that team members could work together in real time from anywhere in the country as well as allow access to external contributors all around the world. Since the agency needs to follow the Government of Canada Digital Standard and use an open source approach, it's important to pick the right platform that would help organize and review the code.

## Decision
GitHub clearly stood out from the rest of the options available for a couple reasons :

* Community and Open-Source Focus
    * GitHub has a more prominent community of developers and is better suited for open-source code development and open-source projects. It's a platform where programmers from around the world collaborate on projects, often with varying levels of knowledge and commitment.

* Version Control
    * GitHub’s continued innovation helped the platform to stay relevant for many years (created in 2008).

* Pipeline Automation with GitHub Actions
    * Reusable Workflows: The GitHub Marketplace provides a platform for developers to share and reuse workflows, reducing the need to recreate common workflow configurations. This is especially useful for common tasks and standard processes across projects.

    * Extensive Integration: It offers a range of third-party integrations and actions that can extend the capabilities of your projects on GitHub. You can find tools for monitoring, testing, deploying, and more.

    * Community-Driven: The marketplace is community-driven, meaning developers can contribute their own actions and workflows, making it a rich ecosystem of tools and automation processes. This is particularly beneficial for open-source projects, as it fosters collaboration and sharing of resources.

* Alignment with Microsoft:
    * Because GitHub is owned by Microsoft, which will help the lab stay in line with the Cloud First policy requirement of the Government of Canada. This makes sure that the contracts and operations are consistent.

    * Microsoft's major contributions to GitHub have made the platform more useful.

    * GitHub has a huge community of users, with 4 million organizations, 330 million repositories used by 90% of the Fortune 100 companies which shows how reliable it is and how widely accepted GitHub is in the industry. This shows that GitHub is widely known, tested and very stable.




## Alternatives Considered

### Alternative 1: GitLab
Pros:
* Iron Mountain platform with GitLab ultimate :
    * $150k in approximate cost savings per year.

    * 20 hours saved in onboarding time per project.

* Integrated AI software.

* User data not used to train AI.

* DevSecOps Platform: Supports teams in software development.

* Named a Leader in the Gartner® Magic Quadrant™ for DevOps Platforms.

* 30m + registered users.

* Used by 50%+ of Fortune 100.

Cons:
* Interface Navigation can be challenging, especially for new users.

* Issue Tracking Customization is limited for some users.

* Certain reviews point out a lack of documentation.

* CI/Automation integration.

### Alternative 2: Azure DevOps
Pros:
* Azure DevOps includes Azure Boards, a project management tool which allows tracking of work items, such as user stories, tasks, bugs, and features. This feature is handy for those following agile methods.

* Azure Test Plans is a testing tool that allows you to plan, execute, and track manual and automated tests.

* Integrates easily with other Azure services and Microsoft products like Visual Studio, Office 365, Azure, etc.

Cons:
* Mainly suited for developers.

* Less prominent open-source community compared to GitHub.

* Can be very overwhelming and complex for small teams as it offers a lot of services and features that are not always useful for smaller projects.

* Pricing is based on the number of users, pipelines, agents, storage space, etc. You may end up paying more than you would with other platforms or tools.

### Alternative 3: Bitbucket
Pros:
* Supports Mercurial as well as Git for version control.

* Supports Semantic Search features such as classes, and interfaces, etc. thus saving a lot of time.

* Allows you than give developers access to every branch in a repo or restrict access to a single branch which reduces the risk of accidental master/main push, it is a key differentiator for Bitbucket.

* Bitbucket supports Git Large File Storage (LFS) which means shorter clone and fetch times for those working with large files.

Cons:
* Challenging with external tools or platforms.

* Feature limitations and less community-driven.

* No built-in Continuous Integration/Continuous Deployment capabilities.

## Consequences

The decision to use GitHub will help the CFIA's AI Lab reach, it will get more people to look at the products and support the open source goals. It will also make DevOps a lot easier with its large community marketplace for workflow. It will also help developers be more productive and improve their work. That being said, the CFIA's AI Lab has a software development team and a data science team with one team using GitHub and the other one using Azure DevOps, which could lead to some complications.

## References
[GetApp * GitLab Reviews](https://www.getapp.com/it-management-software/a/gitlab/reviews/#:~:text=Pros.%20Its%20intuitive%20interface%20and%20robust%20feature%20set,challenging%20for%20new%20users%20to%20get%20started.%20IR)

[TrustRadius * Pros and Cons of GitLab 2023](https://www.trustradius.com/products/gitlab/reviews)

[Vince The IT Guy * Pros and Cons for Using GitLab](https://vincetheitguy.com/gitlab-pros-and-cons/)

[Capiche * GitLab Pros and Cons](https://capiche.com/q/gitlab-pros-and-cons)

[TrustRadius * Azure DevOps Services Reviews](https://www.trustradius.com/products/azure-devops-services/reviews?qs=pros-and-cons)

[Software Advice * Azure DevOps Services Software Reviews, Pros and Cons * 2023](https://www.softwareadvice.com/devops/azure-devops-profile/reviews/)

[Dev.to * Azure DevOps vs GitHub: Which Toolstack Is Better for Software Teams?](https://dev.to/devteams/azure-devops-vs-github-which-toolstack-is-better-for-software-teams)

[StackShare * Reviews, Pros & Cons | Companies using Azure DevOps](https://stackshare.io/azure-devops)

[TrustRadius * Pros and Cons of Bitbucket 2023](https://www.trustradius.com/products/bitbucket/reviews)

[Sysgeeker * Bitbucket Review * Streamline Your Code Collaboration Effortlessly](https://www.sysgeeker.com/bitbucket-review.html)

[CompareCamp * BitBucket Review: Pricing, Pros, Cons & Features](https://comparecamp.com/bitbucket-review-pricing-pros-cons-features/)

[Capterra * Bitbucket Reviews 2023](https://www.capterra.com/p/166497/Bitbucket/reviews/)

[https://about.gitlab.com/customers/iron-mountain/](https://about.gitlab.com/customers/iron-mountain/)
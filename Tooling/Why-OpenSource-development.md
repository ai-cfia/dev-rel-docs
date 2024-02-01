# Why OpenSource development at the CFIA AI Lab

## Summary

There are several reasons why a government agency artificial intelligence lab
should develop their projects openly as open-source development:

1. Transparency: Open-source development provides transparency and
   accountability, allowing citizens to understand how their tax dollars are
   being spent.
1. Collaboration: Open-source development encourages collaboration and
   knowledge-sharing, which can lead to faster and more efficient development.
1. Innovation: By making their projects open-source, government agencies can
   leverage the collective intelligence of the community to identify and address
   potential issues, resulting in more innovative and effective solutions.
1. Security: Open-source development allows for peer review and auditing, which
   can improve the security and quality of the software.
1. Cost-effectiveness: By leveraging the open-source community, government
   agencies can reduce the cost of development and maintenance, as well as avoid
   vendor lock-in.

Overall, open-source development can help government agencies create better,
more secure, and more cost-effective AI solutions that benefit both the
government and the public.

## What are the reasons not to?

There are some potential reasons why a government agency artificial intelligence
lab may choose not to develop their projects openly as open-source development:

1. Security concerns: If the project involves sensitive information or national
   security, making it open-source could potentially expose vulnerabilities to
   bad actors.
1. Resource constraints: Developing a project openly as open-source development
   requires significant time and resources to manage the community
   contributions, which may not be feasible for government agencies with limited
   resources.
1. Lack of expertise: Government agencies may not have the necessary expertise
   to manage an open-source development community, which could lead to quality
   control issues and delays in development.
1. Political considerations: There may be political considerations that make it
   difficult for a government agency to release a project as open-source, such
   as concerns about government overreach or criticism from industry
   stakeholders.

Overall, whether or not a government agency chooses to develop their projects
openly as open-source development depends on a variety of factors, including the
nature of the project, the agency's resources and capabilities, and the
political climate.

## How do we mitigate risks while keeping the benefits

1. Security concerns: The agency can make the project publicly available, but
   limit access to sensitive information to authorized personnel. Additionally,
   the agency can conduct internal security audits and testing to identify and
   mitigate potential vulnerabilities.
1. Resource constraints: The agency can leverage existing open-source
   communities or partner with other organizations to help manage the
   development community.
1. Lack of expertise: The agency can hire or contract with experts in
   open-source development to help manage the community contributions and ensure
   quality control.
1. Political considerations: The agency can engage in public outreach and
   education to build support for the project and address any concerns or
   criticisms.

Overall, by addressing these concerns and taking appropriate measures, a
government agency can still benefit from the advantages of open-source
development while mitigating any potential risks.

## Specifics to our situation

### Dependency to OpenSource

We already depend heavily on opensource tools with open development and
user-contributed work, whether it is [Visual Studio
Code](https://github.com/microsoft/vscode), [Bicep configuration
files](https://github.com/Azure/bicep), [Jupyter
notebooks](https://github.com/jupyter),
[OpenSSL](https://github.com/openssl/openssl),
[Git](https://github.com/git/git).

### Tooling

Github, the OpenSource platform of choice, is owned by Microsoft, our technology
partner and is the premier platform for opensource development.

### Alpha deployment: [alpha.canada.ca](https://alpha.canada.ca/en/index.html)

As part of the Government of Canada’s commitment to experimentation, this web
domain hosts experimental and prototype websites and services. These websites
and services are continually evolving “alpha” products that are still in
development and are not ready for full public use. This domain collects ongoing
experiments in one place, to make it easier for the government to collaborate
and share its experiments. They are publicly available in the spirit of working
in the open.

To be deployed on alpha.canada.ca, a web application or service needs to meet
the following criteria:

* hosted on public cloud infrastructure
* open source on a publicly-visible repository
* automatically deployable via git operations
* use HTTPS
* actively developed within the past four months

### Complying with Government of Canada Digital Standards

[Digital
Standards](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)
require us to do development in the open.

* "Share evidence, research and decision making openly. Make all non-sensitive
  data, information, and new code developed in delivery of services open to the
  outside world for sharing and reuse under an open licence."
* "Collaborating widely allows us to learn lessons from others to minimize
  mistakes and reduce rework by identifying and sharing existing solutions. The
  problems that government solves are often unique, though they are not unique
  among governments."

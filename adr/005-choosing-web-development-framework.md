# ADR-005: Selecting a Web Development Framework for the CFIA AI Lab Website

## Executive Summary
The Canadian Food Inspection Agency (CFIA) Artificial Intelligence Laboratory
(AI Lab) has chosen [Docusaurus](https://docusaurus.io/) for the development of
its new website. This framework addresses our core needs for rapid content
publishing, stringent accessibility compliance, and robust internationalization
support. This strategic choice aligns with the [Government of Canada's Digital
Standards](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html),
reflecting our commitment to openness, continuous improvement, and inclusivity.

## Context
The CFIA AI Lab is at a strategic juncture in its development, recognizing the
imperative to establish a dedicated publishing platform. This platform will act
as a channel for spreading information about our specialized endeavors within
the realm of AI. Our primary goal is to construct a platform where we can
systematically inform visitors about the AI Lab, its spectrum of activities, and
the various projects/products that stem from our work. This initiative will
ensure a consistent flow of information, insights, and scholarly content, all
delivered efficiently to a diverse and international audience.

A pivotal component of this platform is the inclusion of a dedicated blog
section. This feature will empower our Data Science team, alongside other
professionals, to post regular updates, analytical content, and thought
leadership pieces, thereby nurturing a culture of knowledge exchange and
community engagement.

Accessibility remains a critical concern in our operational blueprint,
compelling us to seek a solution that adheres to the most stringent web
accessibility standards while offering extensive customization options.

Furthermore, our operations' global footprint necessitates the integration of
internationalization capabilities in our platform, enabling content creation in
multiple languages and making our insights accessible to a worldwide audience.

Guiding our strategic approach are the [Digital
Standards](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)
set forth by the Government of Canada. These principles emphasize the adoption
of 'open standards and solutions', advocate for 'working in the open by
default', and demand a continuous commitment to 'iterate and improve
frequently'. Central to these standards is the foundational mandate to 'build in
accessibility from the start'. These tenets shape our operational philosophy and
inform our technical decisions, reinforcing our dedication to transparency,
inclusivity, and ongoing improvement.

In light of these requirements and guiding principles, we have ventured into
assessing various technical solutions. Our focus has been on identifying a
system that facilitates rapid content publishing, supports seamless
internationalization, meets strict accessibility norms, and fits within an open
source development framework conducive to continuous evolution and refinement.

## Decision
After a comprehensive evaluation of various platforms and considering our
specific needs for accessibility, rapid content updates, and
internationalization, we have decided to adopt
[Docusaurus](https://docusaurus.io/) as the development framework for the CFIA
AI Lab's new website.

Pros:
* **Rapid Content Publishing**: Docusaurus supports Markdown, making content
  creation fast and efficient for our team. It allows our content creators,
  including those without deep technical expertise, to focus on what they do
  best: creating informative, high-quality content for our audience.
* **Accessibility Compliance**: The framework provides features that are
  compliant with modern web accessibility standards. It supports necessary
  adjustments and customizations, ensuring our content is universally
  accessible.
* **Built-in Internationalization**: Docusaurus comes with out-of-the-box
  support for content internationalization, a critical feature given our need to
  have our content in both official languages.
* **Seamless Integration with Version Control Systems**: Docusaurus's
  compatibility with GitHub will streamline our development process, making it
  easier to manage contributions, track changes, and maintain a high level of
  quality assurance.
* **Flexible Customization**: While Docusaurus offers a robust out-of-the-box
  solution, it also allows for extensive customization given the need. This
  flexibility ensures that we can tweak the platform to meet branding and
  accessibility requirements.
* **Adherence to Digital Standards**: By choosing an open source solution like
  Docusaurus, we are staying true to the governmental standards of employing
  open solutions and working in transparency. This platform also allows for
  continuous improvement, enabling us to iterate effectively, based on user
  feedback and evolving requirements.


However, Docusaurus does have negative aspects that we must keep in mind going
forward: 

Cons: 

* **Learning Curve**: Some team members may need time to familiarize themselves
  with Docusaurus's specific functionalities.
* **Community Size**: The relatively smaller community compared to older
  platforms may mean fewer readily available solutions or guides for niche
  problems.
* **Maintenance Commitment**: Regular updates are necessary, requiring
  consistent attention but without the demand for excessive resources.

## Alternatives Considered

### [Jekyll](https://jekyllrb.com/)
Pros:
* Robust and reliable for static site generation.
* Supports a wide array of themes and templates for various content types.

Cons:
* Requires multiple plugins, increasing security risks and system instability.
* Limited native accessibility features, necessitating manual,
  resource-intensive enhancements.
* Steep learning curve for contributors, particularly those without technical
  expertise.

### [Hugo](https://gohugo.io/)
Pros:
* Fast content rendering and efficient performance.
* Simplified content management due to its organized content structure.

Cons:
* Limited internationalization support complicates multi-language content
  management.
* Insufficient built-in accessibility, requiring extensive manual modifications.
* Customization demands technical depth, slowing deployment and updates.

### [Gatsby](https://www.gatsbyjs.com/)
Pros:
* Feature-rich platform offering extensive capabilities.
* Seamless integration with various data sources and third-party systems.

Cons:
* Excessive complexity for straightforward content sites.
* Potential performance issues with large content volumes, impacting site
  availability.
* Consistent accessibility adherence is resource-intensive, complicating
  maintenance.

### [Wordpress](https://wordpress.com/)
Pros:
* Popular platform with user-friendly content management interfaces.
* Extensive community support and abundant resources for troubleshooting.

Cons:
* Plugin reliance introduces notable security vulnerabilities.
* Varying plugin code quality can lead to performance inconsistencies.
* Achieving rigorous accessibility compliance is complex and uncertain.


## Consequences
The decision to use Docusaurus will set the stage for the development of a
robust, user-centric, and inclusive publishing platform. It will facilitate the
swift sharing of knowledge, foster greater community engagement, and ensure our
content is globally accessible and compliant with the highest standards of web
accessibility. While this approach comes with the responsibility of ongoing
management and engagement with user feedback, it underscores our commitment to
openness, inclusivity, and continual growth, positioning the CFIA AI Lab as a
globally recognized, credible, and accessible source of AI knowledge.

## References
* [Docusaurus](https://docusaurus.io/)
* [Jekyll](https://jekyllrb.com/)
* [Hugo](https://gohugo.io/)
* [Gatsby](https://www.gatsbyjs.com/)
* [Wordpress](https://wordpress.com/)
* [Government of Canada Digital Standards:
  Playbook](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)
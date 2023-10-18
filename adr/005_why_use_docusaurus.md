# ADR 5: Using Docusaurus to develop the AI-Lab website

## Context
The Canadian Food Inspection Agency (CFIA) Artificial Intelligence Laboratory (AI Lab) is at a strategic juncture in its development, recognizing the imperative to establish a dedicated publishing platform. This platform will act as a channel for spreading information about our specialized endeavors within the realm of AI. Our primary goal is to construct a platform where we can systematically inform visitors about the AI Lab, its spectrum of activities, and the various projects/products that stem from our work. This initiative will ensure a consistent flow of information, insights, and scholarly content, all delivered efficiently to a diverse and international audience.

A pivotal component of this platform is the inclusion of a dedicated blog section. This feature will empower our Data Science team, alongside other professionals, to post regular updates, analytical content, and thought leadership pieces, thereby nurturing a culture of knowledge exchange and community engagement.

Accessibility remains a critical concern in our operational blueprint, compelling us to seek a solution that adheres to the most stringent web accessibility standards while offering extensive customization options.

Furthermore, our operations' global footprint necessitates the integration of internationalization capabilities in our platform, enabling content creation in multiple languages and making our insights accessible to a worldwide audience.

Guiding our strategic approach are the [Digital Standards](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html) set forth by the Government of Canada. These principles emphasize the adoption of 'open standards and solutions', advocate for 'working in the open by default', and demand a continuous commitment to 'iterate and improve frequently'. Central to these standards is the foundational mandate to 'build in accessibility from the start'. These tenets shape our operational philosophy and inform our technical decisions, reinforcing our dedication to transparency, inclusivity, and ongoing improvement.

In light of these requirements and guiding principles, we have ventured into assessing various technical solutions. Our focus has been on identifying a system that facilitates rapid content publishing, supports seamless internationalization, meets strict accessibility norms, and fits within an open-source development framework conducive to continuous evolution and refinement.

## Solutions Considered
1. **[Jekyll](https://jekyllrb.com/)**: A robust system, yet it requires multiple plugins for internationalization and has certain limitations in implementing uniform accessibility standards.

2. **[Hugo](https://gohugo.io/)**: Though it's fast and efficient, Hugo requires a substantial amount of custom work to fully support internationalization and integrate consistent accessibility features.

3. **[Gatsby](https://www.gatsbyjs.com/)**: Powerful and feature-rich, but its complexity can make the integration of consistent accessibility features and internationalization support challenging.

4. **[Docusaurus](https://docusaurus.io/)**: Offers a balanced approach with built-in support for internationalization, is built on the familiar environment of React, and allows for extensive accessibility customizations, making it a strong contender.

5. **[Wordpress](https://wordpress.com/)**: Popular, user-friendly, and open source, but its reliance on numerous plugins for full functionality raises security and maintenance concerns, complicating adherence to strict accessibility and internationalization standards.

## Decision
After a comprehensive evaluation of various platforms and considering our specific needs for accessibility, rapid content updates, and internationalization, we have decided to adopt Docusaurus as the development framework for the CFIA AI Lab's new website.

Docusaurus offers a perfect blend of the features we prioritize:

* **Rapid Content Publishing**: Docusaurus supports Markdown, making content creation fast and efficient for our team. It allows our content creators, including those without deep technical expertise, to focus on what they do best: creating informative, high-quality content for our audience.

* **Accessibility Compliance**: The framework provides features that are compliant with modern web accessibility standards. It supports necessary adjustments and customizations, ensuring our content is universally accessible.

* **Built-in Internationalization**: Docusaurus comes with out-of-the-box support for content internationalization, a critical feature given our need to have our content in both official languages.

* **Seamless Integration with Version Control Systems**: Docusaurus's compatibility with GitHub will streamline our development process, making it easier to manage contributions, track changes, and maintain a high level of quality assurance.

* **Flexible Customization**: While Docusaurus offers a robust out-of-the-box solution, it also allows for extensive customization given the need. This flexibility ensures that we can tweak the platform to meet branding and accessibility requirements.

* **Adherence to Digital Standards**: By choosing an open-source solution like Docusaurus, we are staying true to the governmental standards of employing open solutions and working in transparency. This platform also allows for continuous improvement, enabling us to iterate effectively, based on user feedback and evolving requirements.

## Consequences
The decision to use Docusaurus will set the stage for the development of a robust, user-centric, and inclusive publishing platform. It will facilitate the swift sharing of knowledge, foster greater community engagement, and ensure our content is globally accessible and compliant with the highest standards of web accessibility. While this approach comes with the responsibility of ongoing management and engagement with user feedback, it underscores our commitment to openness, inclusivity, and continual growth, positioning the CFIA AI Lab as a globally recognized, credible, and accessible source of AI knowledge.

## References
* [Jekyll](https://jekyllrb.com/)
* [Hugo](https://gohugo.io/)
* [Gatsby](https://www.gatsbyjs.com/)
* [Docusaurus](https://docusaurus.io/)
* [Wordpress](https://wordpress.com/)
* [Government of Canada Digital Standards: Playbook](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)

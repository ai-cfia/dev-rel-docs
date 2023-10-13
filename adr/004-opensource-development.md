# ADR 4: Open-Source Development

## Context
The AI Lab is deliberating on the value proposition and risks of open-source development in government artificial intelligence projects. The goal is to ensure that we align our development efforts with the overall mission, values, and strategic objectives of the agency while also considering security, resource constraints, and quality.

Open source development offers numerous advantages including:

* Transparency and accountability to the citizens.
* Encouraging collaboration and knowledge-sharing.
* Tapping into collective intelligence for innovative solutions.
* Peer-reviewed security enhancements.
* Cost-effectiveness and avoiding vendor lock-ins.

On the flip side, potential concerns include:

* Exposing vulnerabilities, especially when sensitive information is involved.
* Overhead of managing community contributions.
* Potential quality control issues without the necessary expertise.
* Political ramifications and criticism from stakeholders.

Furthermore, our current technological landscape is heavily interwoven with open-source tools. The Government of Canada has also shown a commitment towards experimentation and open development, as reflected in platforms like alpha.canada.ca and the Digital Standards.


### Solutions Considered
**Full Open-Source Development**: Release all projects, without exception, to the public, encouraging community contribution and collaboration.

**Hybrid Approach**: Develop core functionalities privately while making ancillary components or tools open source.

**Private Development**: Keep all developments internal, only releasing tools and products after thorough vetting and quality assurance.


## Decision
After extensive evaluation, we have chosen to adopt the Full Open Source Development approach.

Every project undertaken by the AI Lab will be released publicly, embracing the ethos of open-source development at its core. This means every aspect of our development – from core functionalities to ancillary tools – will be made available to the public, allowing for community contributions, feedback, and collaboration right from the inception of any project.

By committing to full open-source development, the AI Lab is not just adopting a development approach but embracing a philosophy. We believe in the power of community-driven development and are eager to see the innovative solutions this collaborative effort will bring.


## Consequences

**Enhanced Transparency and Trust**: With a full open-source approach, every stakeholder, including the general public, will have direct insight into our development process. This will foster a greater degree of trust and transparency between the lab and its audience.

**Increased Collaborative Potential**: By making all projects open source, we will tap into the collective intelligence of the developer and expert community. This can lead to faster innovations, bug fixes, and richer feature sets.

**Robust Security**: Contrary to traditional beliefs, open-source projects, due to their transparent nature, often undergo extensive peer reviews. Many eyes on the code mean vulnerabilities are spotted and fixed quickly, leading to inherently more secure solutions.

**Compliance and Standard Alignment**: Opting for full open-source development aligns seamlessly with the Government of Canada’s Digital Standards, reinforcing our commitment to sharing, learning, and growing in collaboration with the community.

**Dynamic Feedback and Adaptability**: Immediate feedback from the community means the lab can swiftly pivot, adapt, or modify projects based on real-time insights and suggestions.

**Potential Risks and Mitigation**: It's essential to acknowledge potential security risks associated with sensitive data. Proactive measures, including data anonymization, regular security audits, and stringent contribution guidelines, will be instituted to mitigate these risks.

## References
* [Government of Canada Digital Standards: Playbook](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)
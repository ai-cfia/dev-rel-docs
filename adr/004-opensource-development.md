# ADR 4: Open Source Development

## Context
The Canadian Food Inspection Food Agency (CFIA) Artificial Intelligence Lab's (AI Lab) mission is to push the boundaries of what AI is capable of doing. Our goal is to make it more accessible to CFIA employees by developing practical applications that help the CFIA fulfill its mandate. We are committed to open research and sharing our results with the broader AI community. In order to do so, opting for open source development is a must.

Open source development offers numerous advantages including:

* Transparency and accountability to the citizens.
* Encouraging collaboration and knowledge-sharing.
* Tapping into collective intelligence for innovative solutions.
* Peer-reviewed security enhancements.
* Cost-effectiveness and avoiding vendor lock-ins.

Furthermore, this type of development aligns with the [Government of Canada's Digital Standards](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html):
* Work in the open by default
* Use open standards and solutions
* Collaborate widely

On the flip side, potential concerns include:

* Exposing vulnerabilities, especially when sensitive information is involved.
* Overhead of managing community contributions.
* Potential quality control issues without the necessary expertise.
* Political ramifications and criticism from stakeholders.

Furthermore, our current technological landscape is heavily interwoven with open source tools. The Government of Canada has also shown a commitment towards experimentation and open development, as reflected in platforms like alpha.canada.ca and the Digital Standards.


### Solutions Considered
#### Development
**Full Open Source Development**: Release all projects, without exception, to the public, encouraging community contribution and collaboration.

**Hybrid Approach**: Develop core functionalities privately while making ancillary components or tools open source.

**Private Development**: Keep all developments internal, only releasing tools and products after thorough vetting and quality assurance.

#### Licenses
As we are doing open source development, the choice of license is critical, as it will dictate how other uses can use, modify, and distribute our work. 

1. **MIT License**: Known for its brevity and flexibility, the MIT license allows users to do almost anything they want with the products we develop, like making proprietary versions. However, it requires the inclusion of the original license and copyright notice in any substantial portion of the software, which ensures that credit is always given to the CFIA AI Lab.

2. **GNU General Public License (GPL)**: The GPL is designed to ensure that any adaptations or larger works based on a GPL-licensed project are also open source. It's often chosen to encourage the growth of open source ecosystems, though it can be restrictive for those wanting to incorporate the licensed code into proprietary software.

3. **Apache License 2.0**: This is a permissive license similar to the MIT License but also provides an express grant of patent rights from contributors to users. It allows code use in proprietary software but requires preservation of the original copyright and license notices, along with a list of any significant changes made to the licensed material.

4. **Creative Commons Attribution 4.0**: While not typically used for software, CC BY 4.0 is ideal for creative works. It allows sharing and adaptation of the material as long as appropriate credit is given, a link to the license is provided, and any changes made are indicated.


## Decision
After extensive evaluation, we have chosen to adopt the Full Open Source Development approach.

Every project undertaken by the AI Lab will be released publicly, embracing the ethos of open source development at its core. This means every aspect of our development – from core functionalities to ancillary tools – will be made available to the public, allowing for community contributions, feedback, and collaboration right from the inception of any project.

By committing to full open source development, the AI Lab is not just adopting a development approach but embracing a philosophy. We believe in the power of community-driven development and are eager to see the innovative solutions this collaborative effort will bring.

For the license, we opted for the MIT License due to its straightforward nature, permitting free usage and distribution of our work without cumbersome restrictions, thereby encouraging wider adoption and collaboration.


## Consequences

**Enhanced Transparency and Trust**: With a full open source approach, every stakeholder, including the general public, will have direct insight into our development process. This will foster a greater degree of trust and transparency between the lab and its audience.

**Increased Collaborative Potential**: By making all projects open source, we will tap into the collective intelligence of the developer and expert community. This can lead to faster innovations, bug fixes, and richer feature sets.

**Robust Security**: Contrary to traditional beliefs, open source projects, due to their transparent nature, often undergo extensive peer reviews. Many eyes on the code mean vulnerabilities are spotted and fixed quickly, leading to inherently more secure solutions.

**Compliance and Standard Alignment**: Opting for full open source development aligns seamlessly with the Government of Canada’s Digital Standards, reinforcing our commitment to sharing, learning, and growing in collaboration with the community.

**Dynamic Feedback and Adaptability**: Immediate feedback from the community means the lab can swiftly pivot, adapt, or modify projects based on real-time insights and suggestions.

**Potential Risks and Mitigation**: It's essential to acknowledge potential security risks associated with sensitive data. Proactive measures, including data anonymization, regular security audits, and stringent contribution guidelines, will be instituted to mitigate these risks.

## References
* [Government of Canada Digital Standards: Playbook](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)
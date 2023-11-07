# ADR-004: Open Source Development

## Executive Summary
The Canadian Food Inspection Food Agency (CFIA) Artificial Intelligence
Laboratory (AI Lab) is adopting Full Open Source Development, releasing all
software publicly to encourage transparent collaboration per the Government of
Canada's standards. We've selected the MIT License for its flexibility,
balancing open innovation with safeguarding sensitive data. This approach aims
to harness collective expertise for enhanced innovation and trust in the digital
public sector.

## Context
The CFIA AI Lab is dedicated to advancing the practical applications of AI to
support the agency's specific needs and objectives. By creating accessible
AI-driven tools, we enhance CFIA employees' work, directly contributing to the
agency's mission. While we are rooted in applied solutions, not theoretical
research, we recognize the value of open source development to leverage
collective expertise, ensuring our initiatives are robust, innovative, and
transparent.

Open source development offers numerous advantages including:

* Transparency and accountability to the citizens.
* Encouraging collaboration and knowledge-sharing.
* Tapping into collective intelligence for innovative solutions.
* Peer-reviewed security enhancements.
* Cost-effectiveness and avoiding vendor lock-ins.

Moreover, Microsoft, who was opposed to the open source paradigm considering it
a threat to its business, changed its stance significantly around 2010 when it
began to embrace it. The company recognizes that "[building on the effort of
others allows [them] to create meaningful value for [their] customers and engage
with new ecosystems and user-bases in a natural way.](#ref1)" (Microsoft. n.d.)

On the flip side, open source development does present some potential concerns:

* Exposing vulnerabilities, especially when sensitive information is involved.
* Overhead of managing community contributions.
* Potential quality control issues without the necessary expertise.
* Political ramifications and criticism from stakeholders.

Finally, it's important to understand that "open source" doesn't solely refer to
source code access, software must comply with the [Open Source Initiative's
criteria](#ref2) to be **truly** open source. To put it simply, according to the
Free Software Foundation, the users "[must have the freedom to run, edit,
contribute to, and share the software.](#ref3)" (Free Software Foundation. n.d.)

### Specifics to our situation
#### Dependency to Open Source
We already depend heavily on open source tools with open development and
user-contributed work, whether it is [Visual Studio Code](#ref4), [Bicep
configuration files](#ref5), [Jupyter notebooks](#ref6), [OpenSSL](#ref7), or
[Git](#ref8).

#### Tooling
Github, the open source platform of choice, is owned by Microsoft, our
technology partner, and is the premier platform for open source development.

#### Alpha Deployment: [alpha.canada.ca](#ref9)
As part of the Government of Canada’s commitment to experimentation, this web
domain hosts experimental and prototype websites and services. These websites
and services are continually evolving “alpha” products that are still in
development and are not ready for full public use. This domain collects ongoing
experiments in one place, to make it easier for the government to collaborate
and share its experiments. They are publicly available in the spirit of working
in the open.

To be deployed on [alpha.canada.ca](#ref9), a web application or service needs
to meet the following criteria:

* hosted on public cloud infrastructure
* open source on a publicly-visible repository
* automatically deployable via git operations
* use HTTPS
* actively developed within the past four months

#### Complying with Government of Canada Digital Standards
[Digital Standards](#ref10) require us to do development in the open.

* "Share evidence, research and decision making openly. Make all non-sensitive
  data, information, and new code developed in delivery of services open to the
  outside world for sharing and reuse under an open licence."

* "Collaborating widely allows us to learn lessons from others to minimize
  mistakes and reduce rework by identifying and sharing existing solutions. The
  problems that government solves are often unique, though they are not unique
  among governments."

## Decision
We have chosen to adopt the Full Open Source Development approach.

Every software product undertaken by the AI Lab will be released publicly,
embracing the ethos of open source development at its core. This means every
aspect of our development – from core functionalities to ancillary tools – will
be made available to the public, allowing for community contributions, feedback,
and collaboration right from the inception of any product.

By committing to full open source development, the AI Lab is not just adopting a
development approach but embracing a philosophy. We believe in the power of
community-driven development and are eager to see the innovative solutions this
collaborative effort will bring.

For the license, we opted for the MIT License due to its straightforward nature,
permitting free usage and distribution of our work without cumbersome
restrictions, thereby encouraging wider adoption and collaboration.

### Handling of Sensitive Data
In our approach, we balance public development with private deployment. All
coding and development are conducted openly, to encourage collaboration, while
sensitive data and documents remain secured, only existing in our private,
controlled environments to ensure confidentiality and integrity.


## Solutions Considered
### Development
* **Full Open Source Development**: Release all projects, without exception, to
  the public, encouraging community contribution and collaboration.

* **Hybrid Approach**: Develop core functionalities privately while making
  ancillary components or tools open source.

* **Private Development**: Keep all developments internal, only releasing tools
  and products after thorough vetting and quality assurance.

### Licenses
As we are doing open source development, the choice of license is critical, as
it will dictate how other uses can use, modify, and distribute our work. 

* **MIT License**: Known for its brevity and flexibility, the MIT license allows
  users to do almost anything they want with the products we develop, like
  making proprietary versions. However, it requires the inclusion of the
  original license and copyright notice in any substantial portion of the
  software, which ensures that credit is always given to the CFIA AI Lab.

* **GNU General Public License (GPL)**: The GPL is designed to ensure that any
  adaptations or larger works based on a GPL-licensed project are also open
  source. It's often chosen to encourage the growth of open source ecosystems,
  though it can be restrictive for those wanting to incorporate the licensed
  code into proprietary software.

* **Apache License 2.0**: This is a permissive license similar to the MIT
  License but also provides an express grant of patent rights from contributors
  to users. It allows code use in proprietary software but requires preservation
  of the original copyright and license notices, along with a list of any
  significant changes made to the licensed material.

* **Creative Commons Attribution 4.0**: While not typically used for software,
  CC BY 4.0 is ideal for creative works. It allows sharing and adaptation of the
  material as long as appropriate credit is given, a link to the license is
  provided, and any changes made are indicated.


## Consequences

**Enhanced Transparency and Trust**: With a full open source approach, every
stakeholder, including the general public, will have direct insight into our
development process. This will foster a greater degree of trust and transparency
between the lab and its audience. 

**Increased Collaborative Potential**: By making all projects open source, we
will tap into the collective intelligence of the developer and expert community.
This can lead to faster innovations, bug fixes, and richer feature sets.

**Robust Security**: Contrary to traditional beliefs, open source projects, due
to their transparent nature, often undergo extensive peer reviews. Many eyes on
the code mean vulnerabilities are spotted and fixed quickly, leading to
inherently more secure solutions.

**Compliance and Standard Alignment**: Opting for full open source development
aligns seamlessly with the Government of Canada’s Digital Standards, reinforcing
our commitment to sharing, learning, and growing in collaboration with the
community.

**Dynamic Feedback and Adaptability**: Immediate feedback from the community
means the lab can swiftly pivot, adapt, or modify projects based on real-time
insights and suggestions.

**Potential Risks and Mitigation**: It's essential to acknowledge potential
security risks associated with sensitive data. Proactive measures, including
data anonymization, regular security audits, and stringent contribution
guidelines, will be instituted to mitigate these risks.


## References

* Microsoft’s Open Source Program. Microsoft Open Source. (n.d.).
[https://opensource.microsoft.com/program/#program-using](https://opensource.microsoft.com/program/#program-using)
<a id="ref1"></a>

* The Open Source Definition. Open Source Initiative. (2023, February 22).
[https://opensource.org/osd/](https://opensource.org/osd/) <a id="ref2"></a>

* Homepage. Free Software Foundation. (n.d.).
[https://www.fsf.org/](https://www.fsf.org/) <a id="ref3"></a>

* microsoft/vscode. (n.d.). GitHub.
[https://github.com/microsoft/vscode](https://github.com/microsoft/vscode) <a
id="ref4"></a>

* Azure. (n.d.). GitHub.
[https://github.com/Azure/bicep](https://github.com/Azure/bicep) <a
id="ref5"></a>

* Project Jupyter. (n.d.). GitHub.
[https://github.com/jupyter](https://github.com/jupyter) <a id="ref6"></a>

* Openssl. (n.d.). GitHub.
[https://github.com/openssl/openssl](https://github.com/openssl/openssl) <a
id="ref7"></a>

* Git. (n.d.). GitHub. [https://github.com/git/git](https://github.com/git/git)
<a id="ref8"></a>

* Alpha canada.ca - Canada.ca. (n.d.).
[https://alpha.canada.ca/en/index.html](https://alpha.canada.ca/en/index.html)
<a id="ref9"></a>

* Secretariat, T. B. O. C. (2021, August 13). Government of Canada Digital
Standards. Canada.ca.
[https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html](https://www.canada.ca/en/government/system/digital-government/government-canada-digital-standards.html)
<a id="ref10"></a>






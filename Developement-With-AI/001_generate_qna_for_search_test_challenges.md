# Coding Journey: Addressing Challenges and Finding Solutions

## Chunk Quality and Missing Scores
During development, one significant challenge revolved around chunk quality
ratings, each assigned a score, ranging from 0.0 to 1.0. However, issues emerged
due to missing scores, specifically in identifying tables within chunks and
excluding them from searches. Additionally, discrepancies arose in database
relationships, affecting the accuracy of stored scores.

### Solution Strategy
To address these issues, a multi-step solution approach was devised:

#### Enhancing Database Structure
- **Schema Redesign:** Introduced a new schema, louis_0.0.6, and a corresponding
  table, chunk_scored, to store scores specifically for non-table pages (termed
  as didactic).
- **Transferring Scores:** The existing scoring mechanism was revamped to ensure
  more accurate and clear associations between scores and corresponding pages or
  chunks.

#### Identifying Tables and Navigation Pages
- **Chunk-Specific Scores:** Initiated the creation of chunk-specific scores,
  differentiating between tables and navigation pages to improve search
  accuracy.
- **Methodological Tweaks:** Employed various methods to differentiate between
  page types, such as counting `<tr>` tags for tables and `<a>` tags for
  navigation pages.

### Progress and Challenges
While solutions were proposed and implemented, challenges persisted in
accurately scoring pages due to diverse webpage structures and complexities in
precisely identifying specific page types. For instance, the proportional
approach to scoring based on `<tr>` tags encountered practical limitations due to
varying webpage sizes.

#### Iterative Testing and Refinement
- **Unit Testing:** Efforts were made to implement unit tests to validate the
  search Q&A generation function, aiming to refine and enhance the scoring
  mechanism.
- **Experimentation and Analysis:** Various test scenarios were explored, which included generating histograms to visualize score distributions and testing tables to assess the effectiveness of the solution.

### Ongoing Efforts and Conclusion
The journey involved continuous testing, analysis, and collaboration to overcome
challenges in scoring accuracy, specifically in distinguishing table pages and
navigation pages. While progress has been made, ongoing efforts aim to achieve more precise and reliable scoring mechanisms.

The coding journey involved a combination of schema enhancements, methodological
adjustments, and iterative testing, striving to improve the accuracy and
reliability of scoring within the system.

## Related Links
- [Pull Request #47](https://github.com/ai-cfia/ailab-db/pull/47)
- [Issue #9](https://github.com/ai-cfia/ailab-db/issues/9)
- [Related Issue #4](https://github.com/ai-cfia/finesse-data/issues/4)
- [Stocked
  Q&A](https://github.com/ai-cfia/finesse-data/tree/issue4-new-qna-for-search-jt)

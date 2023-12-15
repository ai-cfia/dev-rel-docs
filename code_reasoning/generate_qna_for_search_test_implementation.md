# Content Analysis and Scoring System for QA Using OpenAI and Azure

## Objective
The goal is to create a system that get web page chunks withing the database,
utilizes OpenAI API via Azure to generate questions and answers, and then
applies a verification to score the accuracy of the results based on the
generated Q&A pairs.

## Implementation Steps
1. **Chunk Extraction:** Retrieve webpage chunks from the database.
2. **Q&A Generation:** Employ Azure OpenAI to generate questions and answers
   from the content. Store this data along with associated URLs.
3. **Initial Results Retrieval:** Use the generated questions to search and
   fetch results.
4. **Results Evaluation:** Compare retrieved URLs with initially extracted URLs
   to gauge search result accuracy.

## Decision Making
- **Benchmarking Quality:** The generated Q&A pairs serve as a quality benchmark
  for content analysis and assist in testing search result accuracy.
- **Addressing Chunk Quality Issues:** Challenges arose with chunk quality
  ratings due to missing scores. Efforts were made to exclude tables and
  navigation chunks from searches.
- **Database Structure Enhancement:** A new schema called louis_0.0.6 and a new
  table named chunk_scored were introduced to store scores for non-table pages
  (didactic).
- **Identifying Tables:** The presence of <tr> tags on pages is used to identify
  tables, aiming to penalize chunks containing them.

## Issues Encountered
- **Token Limitation:** The script crashes if the chunk content exceeds a token
  limit. To manage this, alternative chunks are considered if text exceeds a
  specific length. This is not supposed to happen, but we added a protection
  just in case.
- **Scoring Challenges:** Difficulties persist in accurately scoring pages due
  to varying webpage sizes and complexities in identifying specific page types.
  And the way the scoring is currently made in the database.

## Next Steps for Amelioration
- Continue refining the scoring mechanism for didactic and guidance pages.
- Make the unit tests for the search Q&A generation function working.

The system aims to provide valuable Q&A pairs and ensure search result accuracy,
addressing challenges in chunk quality and scoring accuracy along the way.

## Related Links
- [Pull Request #47](https://github.com/ai-cfia/ailab-db/pull/47)
- [Issue #9](https://github.com/ai-cfia/ailab-db/issues/9)
- [Related Issue #4](https://github.com/ai-cfia/finesse-data/issues/4)
- [Stocked
  Q&A](https://github.com/ai-cfia/finesse-data/tree/issue4-new-qna-for-search-jt)

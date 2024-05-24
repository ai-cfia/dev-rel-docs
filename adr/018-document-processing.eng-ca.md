## ADR-018 : Document Processing Tool

## Executive Summary

The Canadian Food Inspection Agency (CFIA) has chosen the Document Intelligence
platform for the development of the FertiScan application. This platform offers
OCR (Optical Character Recognition) and models capable of accurately extracting
text from images and classify it.

## Context

FertiScan, developed by the CFIA AI Lab, aims to streamline the inspection
process for fertilization labels. Inspectors capture images of these labels, and
the application automatically populates the inspection form. To achieve this,
the system must accurately read and interpret the information displayed on the
packaging.

The existing tools within the CFIA Lab—such as Gemini, GPT-4, and Llama—can
partially understand image content. However, they occasionally “hallucinate”
information, generating text that isn’t actually present in the image. This
poses a risk of erroneous answers in the form.

Moreover, traditional language models (LLMs) struggle to grasp the context of
specific text snippets. For instance, when presented with an image of a
fertilizer package, GPT-4 might identify the text but misclassify it (e.g.,
labeling an address as a name).

To address these challenges, we explored OCR (Optical Character Recognition)
solutions. Our priorities were as follows:

1. **Seamless Integration**: The chosen solution should seamlessly integrate
with our cloud infrastructure—either executing on the inspector’s device or
hosted on Azure.

2. **Open Source**: Ideally, the solution should align with the Government of
Canada’s Digital Standards, advocating for open standards and solutions.

3. **Accuracy**: Accurate recognition and extraction of label text are essential
to provide reliable information to users.

## Decision

The AI Lab has chosen Document Intelligence as the document processing platform
for FertiScan. Here’s why:

1. **Layout Processor**: Document Intelligence excels at identifying tables,
figures, headings, sections, and titles. This feature streamlines the model’s
ability to answer questions about label content or further classify it.

2. **Azure Integration**: Document Intelligence seamlessly integrates with our
existing Azure infrastructure, ensuring a smooth workflow.

On the other hand, we explored Tesseract, an open-source solution. While its
local execution without an internet connection is appealing, its speed and
accuracy fall short. Tesseract often misses text that other solutions
successfully recognize, and it lags significantly behind them.

In summary, Document Intelligence combines accuracy, layout analysis, and Azure
compatibility, making it the optimal choice for FertiScan.

## Alternatives Considered

|   | Document AI (Google) | Document Intelligence (Microsoft) | Tesseract | Textract (Amazon) |

|---|---|---|---|---|

| **Pricing** | OCR: $1.50 per 1000 pages<br>Extract Entities: $30 per 1000 pages
| OCR: $1.50 per 1000 pages<br>Layout: $10 per 1000 pages | Free | OCR: $1.50 per 1000 pages<br>Tables and Requests: $20 per 1000 pages |

| **Performance** | Fast | Fast | Slow | Fast |

| **Accuracy** | High | High | Moderate (with ScribeOCR) | High |

| **Additional Features** | Key-value pair extraction<br>Personalized text extraction models<br>Batch processing | Handwritten text recognition<br>Figures detection<br>Key-value pair extraction<br>Batch processing | Local execution (offline) | Data extraction from tables, forms, and key-value pairs |

| **Cloud Platform** | Google Cloud | Azure | N/A | Amazon Web Service |

| **Training** | Fine-tuning costs $46.39 per hour | Custom models | N/A | N/A |

| **Privacy** | [Privacy Notice](https://cloud.google.com/terms/cloud-privacy-notice?hl=fr)| [Privacy Notice](https://azure.microsoft.com/en-us/explore/trusted-cloud/privacy/)| N/A | [Privacy Notice](https://aws.amazon.com/fr/privacy/)|

| **Licensing** | Closed source | Closed source | Apache Version 2.0 | Closed source |

### Document AI (Google)

**Pros:**

- High accuracy in extracting information from documents.

- Advanced data analysis and automation capabilities.

- Key-value pair extraction in structured forms and simple tables.

- Personalized models for text extraction.

- Batch processing of documents.

**Cons:**

- Doesn't integrate into the existing Azure infrastructure.

- Fine-tuning the models costs $46.39 per hour.

- Requires an internet connection to access the service.

- Struggles with handwritten or complex texts, as it’s primarily designed for
structured content.

### Document Intelligence (Microsoft)

**Pros:**

- High accuracy in extracting information from documents.

- Recognizes handwritten text.

- Seamless integration with Azure infrastructure.

- Customizable models for text extraction.

- Fast extraction of printed and handwritten text from images and documents.

- Custom classification models to split and classify documents.

- Key-value pair extraction and structured data extraction from tables and forms.

- Batch processing of documents.

**Cons:**

- Only available in the East US region.

- Custom models cost $1000 per 20,000 pages.

- Limited to 15 transactions per second.

- Pay-as-you-go service with costs scaling with usage.

- Requires an internet connection for processing.

- Input data and results are held for up to 24 hours.

### Tesseract

**Pros:**

- Free and open-source.

- Supports various image formats including PNG, JPEG, and TIFF.

- Multiple clients available for different use cases.

- Runs locally on the device, allowing offline text recognition.

**Cons:**

- Challenges with complex document layouts, handwriting, or poor image quality.

- Limited to CPU usage, affecting performance.

- Requires manual pre-processing of images to improve legibility.

- Slower processing times compared to cloud solutions.

- Decreased performance with less structured text.

- Lacks key-value pair classification for easier data sorting.

### Textract (Amazon)

**Pros:**

- High accuracy in data extraction from documents.

- Supports various document formats, including scanned PDFs and images.

- Cloud-based service capable of handling large volumes of documents.

- Extracts data from tables, forms, and key-value pairs.

- Integrates seamlessly with other AWS services for further analysis and processing.

**Cons:**

- Pay-per-use service can be expensive for high-volume document processing.

- Limited customization options with pre-trained models.

- Uploading sensitive documents to the cloud may raise security concerns.

- Challenges with complex document layouts, handwriting, or poor image quality.

- Dependency on a single vendor (AWS) might limit future flexibility.

---

## Consequences

### Positive Impacts

1. **Improved Efficiency**: The integration of Document Intelligence will
significantly streamline the inspection process. Inspectors will be able to
quickly capture and process fertilizer label information, reducing the time
spent on manual data entry and increasing overall efficiency.

2. **Enhanced Accuracy**: By leveraging advanced OCR and layout analysis
capabilities, Document Intelligence ensures more accurate text extraction and
classification. This will minimize errors in the inspection forms, leading to
more reliable data collection.

3. **Seamless Integration with Azure**: The compatibility with Azure allows for
a smooth workflow within the existing CFIA infrastructure. This reduces the need
for extensive reconfiguration or additional training for staff, facilitating a
faster implementation.

4. **Scalability and Customization**: The ability to create personalized models
for text extraction and classification means that the system can be tailored to
meet specific needs.

### Negative Impacts

1. **Cost Implications**: The pay-as-you-go model of Document Intelligence,
coupled with costs for custom models, may result in higher expenses compared to
using free solutions like Tesseract.

2. **Dependency on Internet Connectivity**: Since Document Intelligence requires
an internet connection for processing, any connectivity issues could disrupt
the inspection workflow. This dependency might pose challenges in remote or less
connected areas.

3. **Data Privacy Concerns**: The temporary storage of input data and results
for up to 24 hours may raise privacy concerns. It’s crucial to ensure that data
handling complies with CFIA’s privacy policies and government regulations to
maintain stakeholder trust.


## References

#### HaluEval: A Large-Scale Hallucination Evaluation Benchmark for Large Language Models:

   - Li, J., Cheng, X., Zhao, W. X., Nie, J. Y., & Wen, J. R. (2023).
HaluEval: A Large-Scale Hallucination Evaluation Benchmark for Large Language
Models. *Proceedings of the 2023 Conference on Empirical Methods in Natural
Language Processing*, 6449–6464. ¹²

#### **Document AI**:

   - Google Cloud. Document AI. https://cloud.google.com/document-ai?hl=fr

#### **Document Intelligence**:

   - Microsoft Azure. Document Intelligence Studio.
https://documentintelligence.ai.azure.com

#### **Amazon Textract**:

   - Amazon Web Services (AWS). Amazon Textract.
https://aws.amazon.com/fr/textract/

#### **Tesseract OCR Engine**:

   - GitHub repository: tesseract. https://github.com/tesseract-ocr/tesseract

# ADR-20 : DSPy

## Executive Summary

This ADR outlines the decision to use DSPy for calling and optimizing the use
of LLMs in the Fertiscan project. DSPy is a framework that enables the
algorithmic optimization of prompts and weights for LLMs, especially in pipeline
settings. This approach offers a systematic and optimized method for prompting
LLMs, and make it easier to enhance the performance and transparency of LLMs.
The framework's capacity to adapt to evolving data or LLMs and capturing
duplicate entries further strengthens its suitability for the project.

## Context

FertiScan, aims to automate the inspection process for fertilizer labels.
Inspectors capture images of these labels, and the application automatically
generate the inspection form. To achieve this, the system should first convert
the image to text and then use LLMs to match the data available in the extracted
text with the json schema that we have.

Using DSPy, will help us have a more flexible and optimized pipeline. It also
help with having a more reliable pipeline, with prividing the same output for
the same instance and with preventing hallucination. This will eventually help
the end users with more accurate outputs.

## Decision

DSPy will serve as the core framework for orchestrating the LLMs. We will
briefly mention why in the following:

1. **Systematic Prompt Optimization**
2. **Efficiency and Scalability**
3. **Having helper utilities like Caching Mechanism**

## Alternatives Considered

### **Manual Prompt Engineering**

**Pros :**

1. **Direct control over prompt design.**
2. **Potentially simpler for initial implementation**

**Cons :**

1. **Time-consuming and prone to errors**
2. **Difficult to adapt to changes in data or LLMs.**
3. **Manual Prompt engineering requires significant expertise**

### **Fine-tuning Smaller LLMs**

**Pros :**

1. **Potentially lower inference costs compared to larger models**
2. **Can improve accuracy for specific tasks**

**Cons :**

1. **Requires significant computational resources for fine-tuning.**
2. **May not generalize well to new data or tasks.**

## Consequences

### Positive Outcomes

1. **Improved Accuracy and Reliability**: DSPy optimizes prompts and weights,
leading to more accurate and reliable data extraction. It has different
mechanisms to improve the performance of LLMs which are so hard and time
consuming to be done manually. Like using optimizaers that optimize prompts and
weights to improve the defined metric.
2. **Efficiency and Scalability**: DSPy's systematic approach simplifies
development, enabling efficient scaling and adaptation to new data or LLMs.
3. **Transparency and Control**: DSPy modules and signatures offer greater
transparency and control over the data extraction process.

### Negative Outcomes

1. **Learning Curve**: DSPy introduces new concepts and a learning curve for
developers.
2. **Potential Complexity**: Implementing complex pipelines might require expertise in machine learning principles and DSPy's components.

## References

- <https://dspy-docs.vercel.app/building-blocks/solving_your_task//>
- <https://www.youtube.com/watch?v=Y81DoFmt-2U/>
- <https://www.youtube.com/watch?v=JEMYuzrKLUw&t=586s/>
- <https://dspy-docs.vercel.app/docs/category/deep-dive/>

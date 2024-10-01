# ADR-19 : Python Web Framework

## Optional Illustration

| Feature/Aspect               | Flask                                           | FastAPI                                           | Quart                                            |
|------------------------------|-------------------------------------------------|--------------------------------------------------|-------------------------------------------------|
| **Type**                     | Synchronous, WSGI-based                         | Asynchronous, ASGI-based                         | Asynchronous, ASGI-based                        |
| **Performance**              | Moderate, struggles under high concurrency      | High-performance, async by default               | Good performance, fully async                   |
| **Async Support**            | No native support, requires extensions          | Built-in async support                           | Fully async-first                               |
| **Swagger/OpenAPI Support**   | Requires third-party extensions (Flask-Swagger) | Automatic generation of OpenAPI/Swagger docs     | Requires additional libraries (Quart-Swagger, Flasgger)   |
| **Developer Experience**      | Simple to use, but requires manual setups       | Excellent, built-in type validation & async support | Familiar to Flask, but lacks built-in Swagger   |
| **Ecosystem**                | Large and mature                                | Growing, but fewer extensions compared to Flask  | Similar ecosystem to Flask              |
| **WebSockets/HTTP2 Support** | No native support                               | WebSockets via Starlette, but not built-in       | Native WebSocket and HTTP/2 support             |
| **Learning Curve**           | Easy to learn for beginners                     | Moderate, requires understanding of type hints   | Easy for Flask users, but async adds complexity |
| **Best Use Case**            | Small to medium-sized apps                      | High-performance async APIs, microservices       | Real-time apps, Flask-like APIs with async      |

## Executive Summary

This section provides a brief summary of the decision being made, outlining the
main points so that the reader can understand the gist without reading the
entire document.

## Context

Currently, we use Flask to build our APIs. While Flask has been sufficient, it
 is synchronous and lacks some modern features like built-in asynchronous
 support and automatic API documentation (OpenAPI/Swagger). There are other
 open-source frameworks that could better suit our needs by offering enhanced
 developer experience and feature sets. We are considering alternatives like
 FastAPI, Quart, and others that meet our criteria, but only open-source
 solutions will be considered.

## Decision

This section clearly states the decision that has been made, and may also
include justification and reasoning.

## Alternatives Considered

This section presents the different options or solutions considered before
arriving at the final decision. Each alternative is usually discussed in a
subsection.

Here's a list of pros and cons for each framework based on your context:

### **Flask**

**Pros :**

1. **Lightweight**: Minimalistic framework with low overhead, making it easy to
   start with and highly flexible.
2. **Rich Ecosystem**: Mature and well-documented with many extensions (e.g.,
   Flask-RESTful, Flask-SQLAlchemy, etc.) to extend its functionality.
3. **Simple to Learn**: Ideal for small projects and quick prototypes;
   well-suited for beginners.
4. **Large Community**: As one of the most popular Python frameworks, Flask has
   a large community and plenty of resources for help.
5. **Customizable**: You have full control over architecture and can handpick
   the tools you need.

**Cons :**

1. **Synchronous by Default**: Flask's synchronous nature makes it less suited
   for highly concurrent workloads or real-time applications.
2. **No Native Async Support**: Requires extra effort and libraries (e.g.,
   `aiohttp`) to handle async tasks, which can complicate development.
3. **Lack of Built-In Features**: Features like authentication, validation, and
   automatic API documentation require third-party extensions.
4. **Manual API Documentation**: Needs external libraries (e.g., Flask-Swagger,
   Flask-RESTPlus) to generate OpenAPI documentation, adding developer overhead.
5. **Limited for Large Applications**: Scaling Flask for larger, highly
   concurrent APIs or services requires more effort than modern async
   frameworks.

### **FastAPI**

**Pros :**

1. **Asynchronous by Default**: Built on top of Starlette and Pydantic, it
   supports asynchronous programming natively, allowing for better performance
   under heavy concurrency.
2. **Automatic Swagger/OpenAPI**: Automatically generates OpenAPI and
   interactive Swagger documentation with zero configuration, saving time and
   effort.
3. **High Performance**: One of the fastest Python web frameworks, designed for
   performance and scalability.
4. **Modern Python Features**: Type hints and data validation are built into the
   framework, leading to cleaner, more robust code.
5. **Developer-Friendly**: Offers a great developer experience with features
   like automatic validation, dependency injection, and easy testing.
6. **Easy Transition to Async**: You can mix synchronous and asynchronous routes
   easily, providing flexibility.

**Cons :**

1. **Learning Curve**: While FastAPI is developer-friendly, beginners might find
   the reliance on type hints and async a bit challenging.
2. **Smaller Ecosystem**: Though growing, FastAPI’s ecosystem is not as large or
   mature as Flask’s. Fewer extensions and third-party libraries are available
   compared to Flask.
3. **Less Mature**: As a newer framework, it may not be as battle-tested in
   certain scenarios compared to Flask.

### **Quart**

**Pros :**

1. **Asynchronous Support**: Fully async-first framework, designed for handling
   concurrent requests more efficiently than Flask.
2. **Familiar to Flask Users**: Quart maintains a Flask-like API, making it
   easier for Flask developers to switch without much relearning. Quart is
   already used in Nachet so our team is already
   familiar to it.
3. **Rich Ecosystem**: A similar ecosystem as Flask. Both are developped by the
   same team.
4. **WebSocket and HTTP/2 Support**: Native support for WebSockets and HTTP/2,
   making it a good option for real-time applications.
5. **Flexible**: Like Flask, Quart is highly customizable and can be tailored to
   the exact needs of the project.

**Cons :**

1. **No Built-In Swagger Support**: Unlike FastAPI, Quart does not provide
   automatic API documentation, requiring additional libraries or manual setup.
2. **Performance**: While Quart is async-first, it is generally considered
   slightly slower than FastAPI in high-concurrency use cases.

## Consequences

This part outlines the expected outcomes, both positive and negative, of the
decision. This may include its impact on different stakeholders, or any actions
that need to be taken as a result of the decision.

## References

Any documentation, research, or data that support the decision can be cited
here. This can include academic papers, blog posts, or internal documents.

- <https://fastapi.tiangolo.com/>
- <https://flask.palletsprojects.com/en/3.0.x/>
- <https://quart.palletsprojects.com/en/latest/>
- <http://blog.pamelafox.org/2024/07/should-you-use-quart-or-fastapi-for-ai.html>

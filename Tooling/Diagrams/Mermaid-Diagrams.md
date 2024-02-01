# Mermaid Diagrams

[GitHub doc](https://mermaid.js.org/intro/) [Azure
doc](https://learn.microsoft.com/en-us/azure/devops/project/wiki/markdown-guidance?view=azure-devops#add-mermaid-diagrams-to-a-wiki-page)

## Introduction to Mermaid

>"Mermaid is a JavaScript based diagramming and charting tool that uses
Markdown-inspired text definitions and a renderer to create and modify complex
diagrams. The main purpose of Mermaid is to help documentation catch up with
development." (Mermaid Doc, 2024)

In short, mermaid help developer create diagram to document their work. Mermaid
is also integrated into Azure DevOps and GitHub. Using Mermaid can help
developer to document their issues easily without having to create a diagram on
another platform first. Mermaid support a wide variety of diagram such as:

* sequence diagram
* flowchart
* class diagram
* state diagram
* and much more

## How to use Mermaid

In VS code (or codespace) you will need to install these extensions:

* Mermaid Preview
* Markdown Preview Mermaid Support
* Mermaid Markdown Syntax Highlighting

Here's a few examples of how to create a mermaid diagram:

### Flowchart diagram

From left to right

```markdown
  :::mermaid
  graph LR;
      A[Hard edge] -->|link text| B(Round edge) --> C{Decision}
      C --> |One| D[Result one]
      C --> |Two| E[Result two]
  :::
```

:::mermaid
graph LR;
    A[Hard edge] -->|Link text| B(Round edge) --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
:::

From top to bottom

```markdwon
  :::mermaid
     graph TD;
     A[Top]-->B[Down]
  :::
```

:::mermaid
     graph TD;
     A[Top]-->B[Down]
:::
Even if display is similar, GitHub support another syntaxe.

```markdwon
  mermaid
    Flowchart TD;
    Top --> Down
```

_the mermaid code need to be encapsulate in _**```**_ cotation._

### sequence diagram

```markdown
   :::mermaid
      sequenceDiagram
         Christie->>Josh: Hello Josh, how are you?
         Josh-->>Christie: Great!
         Christie->>Josh: See you later!
   :::
```

:::mermaid
      sequenceDiagram
         Christie->>Josh: Hello Josh, how are you?
         Josh-->>Christie: Great!
         Christie->>Josh: See you later!
:::

Again this syntaxe will result in a similar display on GitHub :

```markdwon
mermaid
    sequenceDiagram
        Alice->>John: Hello John, how are you?
        John-->>Alice: Great!
        Alice-)John: See you later!
```

the mermaid code need to be encapsulate in _**```**_ cotation.

For more features on mermaid, visit the doc. [:point_up:](#mermaid-diagrams)

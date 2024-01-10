---
layout: post
title:  "Markdown Diagrams"
date:   "Tue Jan  9 02:27:58 AM EST 2024"
tags: [markdown]
---

# Table of contents

one of of the following:

```
${toc}
[[toc]]
[toc]
[[_toc_]]
```
${toc}

# Image Embedding

Set size (400x200)

![image](https://user-images.githubusercontent.com/5492542/47603494-28e90000-da1f-11e8-9079-30646e551e7a.gif =400x200)

Dyanmic (100%)

![image](https://user-images.githubusercontent.com/5492542/47603494-28e90000-da1f-11e8-9079-30646e551e7a.gif =100%x)

# PlantUML

@startuml
Bob -> Alice : hello
@enduml

Or

``` plantuml
Bob -> Alice : hello
```

# KaTeX

$\sqrt{3x-1}+(1+x)^2$

$$\begin{array}{c}

\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} &
= \frac{4\pi}{c}\vec{\mathbf{j}}    \nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\

\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\

\nabla \cdot \vec{\mathbf{B}} & = 0

\end{array}$$


# mermaid sequence-diagrams

```mermaid
sequenceDiagram
    Note over OrderManager: Receive Order for Widgets, Gadgets, Gizmos
    OrderManager->>Database: Create Order record, status `verified`
    OrderManager->>GoogleSheet: Append row to `orders`, `verified` = TRUE

    OrderManager->>WidgetFactory: POST req, production order
    OrderManager->>GadgetFactory: POST req, production order
    OrderManager->>GizmoFactory: POST req, production order

    Note over WidgetFactory: Schedule production order
    Note over GadgetFactory: Schedule production order
    Note over GizmoFactory: Schedule production order

    WidgetFactory->>OrderManager: POST res, PO received
    GadgetFactory->>OrderManager: POST res, PO received
    GizmoFactory->>OrderManager: POST res, PO received

    OrderManager->>Database: Update Order record, status `in_production`
    OrderManager->>GoogleSheet: Modify row in `orders`, `in_production` = TRUE

    Note over WidgetFactory: Execute production order
    Note over GadgetFactory: Execute production order
    Note over GizmoFactory: Execute production order

    WidgetFactory->>OrderManager: Webhook, order completed
    GadgetFactory->>OrderManager: Webhook, order completed
    GizmoFactory->>OrderManager: Webhook, order completed

    OrderManager->>Database: Update Order record, status `completed`
    OrderManager->>GoogleSheet: Modify row in `orders`, `completed` = TRUE
```

# Flowchart

``` flowchart
st=>start: Start|past:>http://www.google.com[blank]
e=>end: End|future:>http://www.google.com
op1=>operation: My Operation|past
op2=>operation: Stuff|current
sub1=>subroutine: My Subroutine|invalid
cond=>condition: Yes
or No?|approved:>http://www.google.com
c2=>condition: Good idea|rejected
io=>inputoutput: catch something...|future

st->op1(right)->cond
cond(yes, right)->c2
cond(no)->sub1(left)->op1
c2(yes)->io->e
c2(no)->op2->e
```

# dot

``` dot
digraph G {

  subgraph cluster_0 {
    style=filled;
    color=lightgrey;
    node [style=filled,color=white];
    a0 -> a1 -> a2 -> a3;
    label = "process #1";
  }

  subgraph cluster_1 {
    node [style=filled];
    b0 -> b1 -> b2 -> b3;
    label = "process #2";
    color=blue
  }
  start -> a0;
  start -> b0;
  a1 -> b3;
  b2 -> a3;
  a3 -> a0;
  a3 -> end;
  b3 -> end;

  start [shape=Mdiamond];
  end [shape=Msquare];
}
```
# chart.js

``` chart
{
  "type": "pie",
  "data": {
    "labels": [
      "Red",
      "Blue",
      "Yellow"
    ],
    "datasets": [
      {
        "data": [
          300,
          50,
          100
        ],
        "backgroundColor": [
          "#FF6384",
          "#36A2EB",
          "#FFCE56"
        ],
        "hoverBackgroundColor": [
          "#FF6384",
          "#36A2EB",
          "#FFCE56"
        ]
      }
    ]
  },
  "options": {}
}
```

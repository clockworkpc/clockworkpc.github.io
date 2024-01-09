---
layout: post
title:  "ERP Simulation Diagram"
date:   "Tue Jan  9 05:41:57 AM EST 2024"
tags: [markdown,erp]
---

``` mermaid
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

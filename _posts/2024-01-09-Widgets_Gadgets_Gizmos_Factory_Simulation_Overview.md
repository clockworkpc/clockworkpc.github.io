---
layout: post
title:  "Widgets, Gadgets, Gizmos: Factory Simulation Overview"
date:   "Tue Jan  9 05:48:45 AM IST 2024"
tags: [erp,cloud,api,microservices,rails,django,nodejs]
---
## Schematic Overview

![Schematic Overview](/assets/backend_devops_portfolio_production_simulation_overview.png)

The simulation of a manufacturing business is composed of the following microservices:
- Factories
- Order Manager
- Customer and Product Manager
- Central Database
- Google Sheet for input of `completed_orders`
- Google Sheet dashboard of `completed_orders`

## Factories

Each factory is an API server built using Rails, Django, or Node.js.  It has its own local database to which it records the details of production requests.
Every Product has some attributes inherited from the parent `Product` model and some unique attributes.

### Process Flow

1. Receive an authenticated POST request from the Order Manager, which is a registered user on the Factory microservice, which includes the Order Number and the details of the products for said order.  For example, a production order to the Widget Factory 
2. Create a record in the `production_order`

---
layout: post
title:  "Widgets, Gadgets, Gizmos: Factory Simulation Overview"
date:   "Tue Jan  9 12:50:10 AM EST 2024"
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

## Factory Microservices

Each factory microservice is an API server built using Rails, Django, or Node.js.  It has its own local database to which it records the details of production requests.
Every Product has some attributes inherited from the parent `Product` model and some unique attributes.

### Process Flow

1. Receive an authenticated POST request from the Order Manager microservice, which is a registered user on the Factory microservice, which includes the Order Number and the details of the products for said order.  Examples of production orders:
- 1 * Widget with default attributes
- 1 * Widget with custom attributes
- 1 * Widget with default attributes, 1 * Widget with custom attributes
- various quantities of Widgets with differing custom attributes

2. For each product configuration create a separate record in the local `production_orders` table, including `order_number`, `quantity`, `attributes`.

3. Send a POST reply to confirm receipt of production order.

4. Schedule a production job for the proudction order.  I am considering a method of calculating the duration of the job by its complexity, which would be effected by executing a `sleep` function with a corresponding value in seconds.  This would simulate longer production times for larger or more complex orders.

1. Upon completion of the production job, send a webhook to the Order Manager microservice.

## Customer Manager Microservice

A small server responsible for the CRUD of records in the `customers` table in the central database.  Via the UI or API, an authorised user can create a new `customer`, update or delete it.  The Order Manager microservice queries this microservice for up-to-date details of a customer, which it uses to verify an API order and to populate a drop-down list of current customers in the order form in the UI.

## Product Management

In this iteration of the manufacturing simulation, there are three `Products` only, the manufacture of each being handled by a separate Factory microservice.  The reason for not creating a single Factory that "manufactures" all products, and which would simplify the addition of new products, is to give myself the challenge of creating identical microservices in Rails, Django, and Node.js respectively.

## Order Management Microservice

The heart of the simulation is the Order Manager, which queries the Customer Management microservice, sends production requests to the Factory microservices, receives thence the details of completed production orders, updates the central database, and sends the same details to a Google Spreadsheet via the **Google Spreadsheet API**.  It will provide both a UI and an API for manual creation of orders and also generate random orders at regular intervals by means of scheduled Tasks.

### Process Flow

#### Manual Order

1. Receive a manual order form via POST request from the UI.
2. Schedule a job to generate a production request 
3. Send a POST reply to confirm receipt of request.
4. Generate an order for the nominated customer.
5. Save the order details to the database.
6. Transmit the details to the `orders` Google Sheet with the status `verified`
7. Send a production request (POST) to the relevant Factory microservice(s).
8. Receive confirmation of receipt of request from each Factory microservice.
9. Update the status of the order in the databases as `scheduled`.
10. When all production requests have been confirmed as scheduled, transmit another line item to the `orders` Google Sheet with the status `scheduled`.
11. Asynchronously receive a webhook from each Factory and update the order record in the database.
12. When all production requests have been confirmed as complete, transmit another line item to the `orders` Google Sheet with the status `complete`.

#### Automated Order

1. Execute a scheduled Task (e.g. Rake in Rails) to generate an order for a random customer.
3. Save the order details to the database.
4. Transmit the details to the `orders` Google Sheet with the status `verified`
5. Send a production request (POST) to the relevant Factory microservice(s).
6. Receive confirmation of receipt of request from each Factory microservice.
7. Update the status of the order in the databases as `scheduled`.
8. When all production requests have been confirmed as scheduled, transmit another line item to the `orders` Google Sheet with the status `scheduled`.
9. Asynchronously receive a webhook from each Factory and update the order record in the database.
10. When all production requests have been confirmed as complete, transmit another line item to the `orders` Google Sheet with the status `complete`.


## Google Sheet

The reason for including a Google Sheet in this simulation is that this is a demonstration of backend and DevOps skills, not front-end skills.  By transmitting the details of orders as they move through the production process simulation to a Google Sheet, not only do I demonstrate third-party API integration, but also utilise the familiar Google Sheet as an easy to build dashboard.  This can also be combined with a Dashboard solution sitting on top of the Google Sheet source data.

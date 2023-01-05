---
layout: post
title:  "Woodworking ERP First Thoughts"
date:   "Thu Jan  5 08:17:33 AM EST 2023"
tags: [database,design]
---

I want to build a very simple ERP (Enterprise Resource Planning) tool for my home-based woodworking.

## Context

I have a setup at home to work with reclaimed lumber, which suffers from various defects:

- Warping
- Cupping
- Bowing
- Rough edges
- Rough faces
- Embedded metal, i.e. nails or screws
- Dirt, concrete, or old finish

In order to work with this lumber, I need to process each board such that it will satisfy the following conditions:

- Straight, parallel edges
- Planed, parallel faces
- Clean surface
- No embedded metal

## Specifications

### Primary Application

1. Keep an inventory of rough, reclaimed lumber.
2. Record the changes in cleaning up and straightening the rough lumber.
3. Record the products that are created from the lumber.

### Secondary Application

1. Keep track of machines
2. Keep track of tools, both hand tools and power tools
3. Keep track of consumables, e.g. screws

## Initial Development

The central Model is the `Lumber`, which contains the following attributes:

| Attribute                      | Type      | Description                                                                                                              |
|--------------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------|
| uuid                           | string    | A barcode generated in advance, printed, and applied to each board                                                       |
| length                         | float     | Initially the length of the rough board                                                                                  |
| width_start, width_end         | float     | Width measured at each end,  can differ on a skew board                                                                  |
| thickness_start, thickness_end | float     | Thickness measured at each end, can differ on a tapered board                                                            |
| wood_type                      | reference | Reference to the WoodType model                                                                                          |
| straight_edge                  | boolean   | Whether the straight-edge jig has been used                                                                              |
| parallel_edges                 | boolean   | Whether the opposite edge has been cut using the straight-edge as a reference                                            |
| planed_face                    | boolean   | Whether the planing jig has been used                                                                                    |
| parallel_faces                 | boolean   | Whether the opposite face has been planed using the planed face as a reference                                           |
| square                         | boolean   | Whether all sides in all directions are square, i.e. whether the board is ready to be used                               |
| timestamps                     | datetime  | created_at and updated_at                                                                                                |
| changelog                      | jsonb     | A JSON Array of Objects, each one containing all of the above attributes and a timestamp, to allow changes to be tracked |

The `Lumber` model has the following relationships:
- `belongs_to :barcode`
- `belongs_to :wood_type`
- `belongs_to :product, through: :lumber_products`

## Workflow

1. Generate a mass of Barcode records, where the UUID is translated into a barcode.
2. Print the barcodes, to have on hand.
3. Attach a barcode to each board of reclaimed lumber
4. In the `lumber` create form, enter the board's attributes along with the barcode
5. Use the barcode to bring up the `lumber` edit form to update attributes during or after processing.


 ![My helpful screenshot](/assets/woodworking_erp.png)

---
layout: post
title:  Query a database with Active Record
date:   Sun 29 Mar 12:38:56 AEDT 2020
tags: [sql, rails, activerecord]
---
| SQL                                            | Active Record |
|------------------------------------------------|---------------|
| `SELECT * FROM subjects`                       | `Subject.all` |
| `SELECT * FROM pages p WHERE p.visible = true` | `Page.where(visible: true)`              |
| `SELECT * FROM pages p WHERE p.subject_id = 3` | `Page.where(subject_id: Subject.first.id)`              |

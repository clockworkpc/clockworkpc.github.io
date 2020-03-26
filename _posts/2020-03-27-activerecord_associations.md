---
layout: post
title:  ActiveRecord Associations
date:   Fri 27 Mar 08:56:19 AEDT 2020
tags: [rails, database, sql]
---
This is a simple explanation of some basic concepts of [Active Record Assocations](https://guides.rubyonrails.org/association_basics.html).

## School Example

We have the following entities:
1. Classroom
1. Teacher
1. Pupil
1. Subject

## Active Record Assocations

```ruby

Classroom has_one :teacher
Teacher belongs_to :classroom

Teacher has_many :courses
Course belongs_to :teachers

Course has_and_belongs_to_many :pupils
Pupil has_and_belongs_to_many :courses

```

## Database Tables

| classrooms  |
|-------------|
| id          |
| room_number |


| teachers     | foreign_key     |
|--------------|-----------------|
| id           |                 |
| name         |                 |
| classroom_id | `classrooms.id` |


| courses    | foreign_key   |
|------------|---------------|
| id         |               |
| title      |               |
| teacher_id | `teachers.id` |


| pupils |
|--------|
| id     |
| name   |


| course_pupils | foreign_key  |
|---------------|--------------|
| pupil_id      | `pupils.id`  |
| course_id     | `courses.id` |




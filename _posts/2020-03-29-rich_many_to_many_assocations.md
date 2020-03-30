---
layout: post
title:  Rich Many-to-Many Assocations
date:   Sun 29 Mar 16:37:44 AEDT 2020
tags: [activerecord, sql, rails]
---
## Tables: AdminUser and Section

```ruby

  create_table "admin_users", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "email", default: "", null: false
    t.string "hashed_password", limit: 40
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "page_id"
    t.string "name"
    t.integer "position"
    t.boolean "visible", default: false
    t.string "content_type"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["page_id"], name: "index_sections_on_page_id"
  end

```

## Assocations: `admin_users`, `sections`, `section_edits`

```ruby

AdminUser has_many :section_edits
AdminUser has_many :sections, through: :section_edits
SectionEdit belongs_to :admin_user

Section has_many :section_edits
Section has_many :admin_users, through: :section_edits
SectionEdit belongs_to :section

```

## Tables

| admin_users | section_edits | sections |
|-------------|---------------|----------|
| **id**      | admin_id      |          |
|             | section_id    | **id**   |


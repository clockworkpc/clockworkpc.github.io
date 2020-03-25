---
layout: post
title:  Tables and Columns
date:   Wed 25 Mar 16:23:06 AEDT 2020
tags: [sql, db, backend]
---
I always have to look up this SQL query.  It's one of the most useful in my experience:

```sql
SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'your_schema'
   AND table_name   = 'your_table'
     ;
```

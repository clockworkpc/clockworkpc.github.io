---
layout: post
title:  CORS config
date:   Tue 28 Apr 15:32:46 AEST 2020
tags: [rails,config]
---
```ruby
config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "/api/*",
      :headers => :any,
      :credentials => false,
      :methods => [:post, :options]
  end
end
```

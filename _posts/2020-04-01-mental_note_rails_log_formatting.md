---
layout: post
title:  Rails Log Formatting
date:   Wed  1 Apr 10:19:50 AEDT 2020
tags: [rails, logger, configuration]
---
Not sure where to put this:

```ruby
logger.formatter = proc do | severity, time, msg |
text = "#{time}, #{severity}: #{msg}
"

  case severity
  when "FATAL" || "ERROR"
    Rainbow(text).red
  when "WARN"
    Rainbow(text).orange
  when "INFO"
    Rainbow(text).yellow
  else
    Rainbow(text).white
  end

end
```

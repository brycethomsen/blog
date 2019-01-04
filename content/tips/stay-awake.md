---
title: "Stay Awake"
description: "Built in utility to prevent your mac from sleeping."
date: 2019-01-04T13:33:24-08:00
categories: ["tips"]
tags: ["tips", "mac", "caffeinate"]
draft: false
---

Sometimes you just want to keep your laptop from going to sleep. There is a built in utility to accomplish this on Mac.

Typically, I run the following in a seperate window when I start my workday:
```
caffeinate -id
```

Or other options:
```
# From the manpage
Available options:

     -d      Create an assertion to prevent the display from sleeping.

     -i      Create an assertion to prevent the system from idle sleeping.

     -m      Create an assertion to prevent the disk from idle sleeping.

     -s      Create an assertion to prevent the system from sleeping. This asser-
             tion is valid only when system is running on AC power.

     -u      Create an assertion to declare that user is active. If the display
             is off, this option turns the display on and prevents the display
             from going into idle sleep. If a timeout is not specified with '-t'
             option, then this assertion is taken with a default of 5 second
             timeout.

     -t      Specifies the timeout value in seconds for which this assertion has
             to be valid. The assertion is dropped after the specified timeout.
             Timeout value is not used when an utility is invoked with this com-
             mand.

     -w      Waits for the process with the specified pid to exit. Once the the
             process exits, the assertion is also released.  This option is
             ignored when used with utility option.
```

If there is a specific process that you want to run and keep the computer awake you can enter the command as an argument:
```
# Again, from the manpages

EXAMPLE
     caffeinate -i make
        caffeinate forks a process, execs "make" in it, and holds an assertion
     that prevents idle sleep as long as that process is running.
```
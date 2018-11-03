---
title: "Fixing the Fire Alarm Funko Pop! Minion"
description: ""
tags: [ "electronics", "mods" ]
date: "2018-10-08"
categories:
  - "electronics"
draft: true
---
Recently, I was joking with a friend and coworker about Funko Pop figures, specifically the *Minion* figurines. About a week later I was surprised with a gift, a [Fire Alarm Minion](https://www.funko.com/products/all/fandoms/despicable-me/pop-movies-despicable-me-fire-alarm)! After recovering I thought to myself "it looks like it should light up", but alas it didn't... 
So... here is a quick little build log to "fix" the Fire Alarm Minion to blink, like a... fire alarm!

### Parts Needed:
- 555 timer
- 470k ohm resistors x2
- 220 ohm resistor x1
- 100 µFarad capacitor x1
- 10mm red LED x3
- PCB for astable circit (or perfboard to make your own)
- Some wire
- Drill
- Dremel
- Solder Iron (and solder)
- Hot glue


Firstly, I could see that the sirens were not made from the same material as the rest of the figureine. After some prying I was able to get these to snap right off.

![Removed sirens](../img/minion-front.jpg)

I debated about how best to get inside of the figureine. It seemed to be made of one piece of plastic, so there was nothing to pry open... Dremel time. I should have used a thinner cutting disk as I intended to reseal the hole after adding the circuit.

![Dremel inside](../img/minion-back.jpg)

Now that I had access to inside, I drilled some holes for the LEDs. I started with a small bit, and worked my way up to my largest bit that was just slightly smaller than the 10mm LEDs giving them a snug fit. 

![Drill in top](../img/minion-top.jpg)
![Drill out sides](../img/minion-side.jpg)

After test fitting an LED, I wired up the LEDs in series, giving myself ample wire to connect to the circuit. I stuffed all the LEDs into their new sockets.

![Inside look at leds](../img/minion-inside.jpg)

A few years ago, I purchased a few PCBs that form an astable circuit for a 555 timer. Since I had a few of these laying around, I decided to use one, but you could make your own on a piece of perfboard.

![555 timer circuit board](../img/minion-555.jpg)


Hurray, the Fire Alarm Minion blinks now!

![Finished](../img/minion-blink.mov)

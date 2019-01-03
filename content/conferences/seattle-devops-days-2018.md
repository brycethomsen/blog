---
title: "Seattle DevOps Days 2018"
description: ""
date: 2019-01-02
categories: ["cons"]
tags: ["devops", "devops days", "conference"]
draft: false
---

I was able to go to DevOpsDays Seattle this year, this is a summary of the conference and some of the highlights. Like most other "DevOps" conferences most of the presentations had to do with the human side of the job. Building more effective communication and teams by influencing the culture of the company.
### Taking Human Performance Seriously In Software - John Allspaw

    "As the complexity of a system increases, the accuracy of any single agent's own model of that system decreases." – Wood's Theorem

This talk felt pretty lofty and theoretical, in that any of the work that we do as engineers is actually done via representations of our systems. For example, you can't actually see the code running on distributed systems, you see a few pieces at a time from different tools; monitoring, terminal, etc.

From this perspective John, suggests we should:

- Avoid relying on shallow metrics and focus more on what each person's experience is during an incident.mortem
    - Ask more questions during post post-mortems
    - Ask meta questions; are these good questions to ask for the post-mortem
- Stop looking for a "root cause", there are no simple answers to a complex problem
    - when you look for a simple answer you look sight of the bigger picture
    - "no one ever said that the root cause of a plane crash was gravity"

## You’re so empathetic, you probably know this talk’s not about you - Sarah Hagan

In this talk, Sarah highlighted the importance of self-awareness in a team setting and understanding your cognitive bias. If you have an understanding of how you like to work, sharing it with the team will help build trust with the team and increase productivity and communication. She recommended taking the DISC Personality Test, then:

- talk to the team about your personality results
    - vulnerability builds trust
shadow/learn how your teammates like to work (see they're day-to-day workflow)
- build workplace relationships
    - don't always talk shop
    - ask good questions

Sarah also suggested adding an "emotional check-in" do your team's daily standup. Like a scale from 1-5 for unhappy to happy or using a quadrant showing negative to positive mood and negative to a positive mood.

She advocated that every employee should seek feedback from their teammates and some tips for doing so:

- Talk face-to-face
- Prime the feedback (tell the listener you're about to give them feedback)
- No sandwich protocol (complement/criticism/complement)
- Make it timely
- Focus on the SBI (Situation, Behavior, and Impact)
- Follow up when appropriate
- Praise is more important than negative feedback

## From developing code to developing people - Doug Ireton

Doug talked about his transformation from being an engineer to a manager. He shared his thoughts on what it means to be a leader.

Leaders should:

- align their team
- believe in the company
- highlight individuals
- shape the culture more than anyone
- care about co-workers
- mentor others
- read books!
- develop the team
    - 1 on 1s for longer-term goals
    - give business context
    - listen more than talk
- give immediate feedback
    - debrief after meetings about what went well and what could be better next time
- delegate messy projects (but provide a safety net)
    - messy projects stretch and increase leadership skills on  the team
- make mistakes, but then adjust

## Change Management for Humans - Tiffany Longworth

Tiffany outlined how to effectively make a change, using the acronym **A.D.K.A.R.**

**A**wareness - go for an emotional impact, have stakeholder interviews

**D**esire - why they would want it?

**K**nowledge - don't start here, details of how to utilize the changed thing

**A**bility - show success stories, aka show a clear path

**R**einforcement - commit to the change, schedule follow-ups in advance

## Kubernetes is a Platform platform - Joe Beda

Joe talked about what Kubernetes is and how it will shape the future of distributed systems. Overall this was a breakdown of how all the components interact with one another and some ideas for the platform in the near future. I may do a separate write up if there's interest.

## Takeaways

My takeaways to try with my team:

- Do [Value Stream Mapping](https://en.wikipedia.org/wiki/Value_stream_mapping) exercises with our workflows to find bottlenecks then streamline
- Put a higher value on testing (unit, integration, etc)
- Opt-In personality tests and discussion of the results for building a more efficient team
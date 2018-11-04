---
title: "Hello, World!"
tags: [ "general" ]
date: "2018-11-03"
categories:
  - "general"
draft: false
---

Surely (if you're looking at starting a blog) you've heard of [Hugo](https://gohugo.io/), in short, it's a framework written in *Go* for building static websites. Perfect for blogs!
I've decided to use it for this very blog. There are many, many different resources for getting started, but here's my take on it.

Firstly, some criteria for my blog.

1. Low cost (if not free)
2. Very little maintenence
3. HTTPS
4. Easy to add posts

Hugo fits the bill for 2, as it renders posts written in [Markdown](https://daringfireball.net/projects/markdown/) to static files to be served (less vulernabilites, faster loading, etc, etc)

## Installing Hugo

1. Download the appropriate [Hugo version](https://gohugo.io/getting-started/installing/)
2. Execute `hugo new <your-blog>` which creates the [directory structure](https://gohugo.io/getting-started/directory-structure/)
3. Add a post to the *content/* directory
4. Test that your blog renders correctly with `hugo server`

## Deploying to the Internet

Originally, I considered hosting as a Github Pages site or continuing to host the static content via AWS S3, but ultimately choose [Netlify](https://www.netlify.com/) at least for now.  Netlify, checks boxes 1,3, and 4 on my list. I only needed to create an account, point it at Github, and redirect my existing domains to an endpoint for this site. Once that was completed HTTPS certificates are generated via [Let'sEncrypt](https://letsencrypt.org/).


So here we are, a pretty painless setup for a blog.
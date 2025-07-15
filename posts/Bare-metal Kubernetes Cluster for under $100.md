---
title: "Bare-metal Kubernetes Cluster for under $100"
date: "2025-03-03"
draft: false
tags: ["Kubernetes", "Homelab", "Cloud"]
---

Over the years I've seen a fair number of posts and had colleagues who put together Raspberry Pi Kubernetes clusters. It's been something I've wanted to put together for myself, but I've also wanted to build it for as cheap as possible. 

My goals for this project:

1. 3 node cluster
2. Low-power usage
3.  For less than $100

## The Hardware

In the beginning, I looked at a few different options here; Raspberry Pis (and other SoCs), mini-PCs, used enterprise gear, and some embedded systems like the [ASRock N100](https://www.newegg.com/p/N82E16813162133). Pros and cons all over the board and always exceptions, here's my general impressions:

|  | Price | Low-power |
| ---- | ---- | ---- |
| Raspberry Pi | $$$ | ✅ |
| Used Enterprise | $ | ❌ |
| Mini-PCs | $ | ✅ |
| Chromebox | ¢ | ✅ |
| Custom Build | ? | ? |

## Flashing New BIOS

One of the reasons Chromebooks are so cheap is they are locked down to only run ChromeOS

## Cluster Setup

The motivation for this cluster in the first place is to have a low-stakes playground for new addon. I want to make it easy add something and then remove it and to make it easy to re-create nodes if things really go south. Certainly there are a few different options that fit the bill, but I went for [k3s.io](https://k3s.io/) since the Chromeboxes are fairly limited on resources. 

K3s makes it dead simple to [spin up a cluster](https://docs.k3s.io/quick-start).
```bash
# On the first node
curl -sfL https://get.k3s.io | sh -

# Grab your token
cat /var/lib/rancher/k3s/server/node-token

# On the other nodes
curl -sfL https://get.k3s.io | K3S_URL=https://<your-ip>:6443 K3S_TOKEN=mynodetoken sh -
```
Boom. We've got ourselves a cluster!

## Bonus: Power Tuning
### c-states
```bash
$ sudo cpupower monitor

    | Nehalem                   || Mperf              || Idle_Stats                                                   

 CPU| C3   | C6   | PC3  | PC6   || C0   | Cx   | Freq  || POLL | C1   | C1E  | C3   | C6   | C7s  | C8   | C9   | C10   

   0|  8.78|  0.11|  2.12|  0.00|| 10.07| 89.93|  1495||  0.00|  0.47|  3.52| 52.41|  0.12|  1.69|  1.51| 13.16| 17.25

   1|  6.41|  0.55|  2.12|  0.00||  8.09| 91.91|  1495||  0.00|  1.15|  5.58| 35.02|  0.58|  2.02|  5.80| 24.19| 17.63
```
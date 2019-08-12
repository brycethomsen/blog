---
title: "Kubecon 2018"
description: ""
date: 2019-01-02T12:56:07-08:00
categories: ["cons"]
tags: ["cons, kubecon, kubernetes, k8s"]
draft: true
---

## Overall Themes and Trends

- [Observability](#Observability)
- [Using Operaters and Custom Controllers](#Using Operaters and Custom Controllers)
- [Know Thy Kubernetes]
- [Building the Kubernetes Community]

## Observability

I was able to attend the Obersability Practioners Summit (an addon package to KubeCon) that featured talks about how to best instrument your clusters for maximum visability; in a nutshell "understand the task to pick your visualization."

My take away from the day was a few bullet points to loop though when troubleshooting:
1. Something is weird.
2. What do you think is happening?
3. Have metrics that can proves "something" is weird. Work from a "general view" down to specifics
4. Confine your search space (dynamic instrumentation is helpful here)

## Using Operaters and Custom Controllers



## Know Thy Kubernetes

Kubecon had a huge number of tools being showcased; from [Helm](https://helm.sh/) to [Knative](https://github.com/knative/). It seemed that for every problem or variation of problem there was at least 3 tools that could resolve it and some of the tools seemed like they were inventing solutions to problems that haven't been uncovered yet.

With all of these tools at your disposal, it becomes less about which tool you choose and more about understanding Kubernetes.

### Summary of Tools

In no particular order:
|Tools|Summary|
|---|---|
|GNUPlot|command-line driven graphing utility|
|Envoy|Proxy|
|[Helm](https://helm.sh/)|K8s manifest template|
|[Auger](https://github.com/jpbetz/auger)|Directly access data objects stored in etcd by kubernetes|
|[Dive](https://github.com/wagoodman/dive)|tool for exploring a docker image|
|[Kubebuilder](https://github.com/kubernetes-sigs/kubebuilder)|framework for building Kubernetes APIs using custom resource definitions|

## Building the Kubernetes Community

## Summary

### Books/Papers that were mentioned

- [Dapper](https://ai.google/research/pubs/pub36356) from Google
- [Canopy](https://research.fb.com/publications/canopy-end-to-end-performance-tracing-at-scale/) from Facebook

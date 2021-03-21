---
layout: post
title: "Refactor Your Terraform Repository Now"
date: 2021-03-21 16:22:26 +0100
categories: jekyll infrastructure iac computer-science sre site-reliability-engineering
---
*Still hardcoding all your default vars, still struggling with one or maybe two **big** Terraform files creating your whole infrastructure? Read on.*
----

Usually, when starting with Terraform (or other IaC providers) you will have a certain time-spec for writing all the stuff down and automizing your infrastructure.
And this is perfectly okay - for sandboxing.

> We need to make it work right now - later we can figure out how to improve it. When we're running production, we'll have some extra time to improve and make it better.

Sounds familiar to you? That's how it starts. You've really did a good one on wanting to refactor your repository.

## Refactoring Improves Many Aspects

----

When your first Terraform repository works and you've copied it x3 (development, integration, production) you will already feel that something's wrong. Why exactly do I have to have so much
redundancy inside my IaC repository? Shouldn't Terraform do more? Yes, it does and it will, if you do it right.

At first glance, it seems terrifying to touch existing Terraform resources. I mean, in most cases that's the most low-level code you can touch when using cloud infrastructures. This is your single-point-of-truth. This is the place where stuff gets born, where stuff dies and where developers depend on you.

Unfortunately, there's no friendly, sun-shining way of debugging your Terraform repo at first. But it will become easier when you have done the steps below.

Also, it will be a lot easier for other users to look at your Terraform code and work with it. You and the other users will become very confident touching existing Terraform code.

## Break Up Monoliths

----

You know it hurts to touch monoliths. Infrastructure monoliths are even worse. One little mistake and the infrastructure goes down (or your Terraform state is unstable, which can result in you having to delete your whole project and start from zero).

It's hard to debug and hard to get confidence in touching it. Also, think of how much time you could save if there weren't several hundreds or thousand lines of code you'd have to look through to find the point where you need to work on.

## Smaller files and Modularizing

----

With smaller files and clear naming, you'll find what you're looking for in seconds. Promise.

Terraform is really good at handling smaller files. It'll get packed into one execution plan with `terraform plan` or `terraform apply`. Use this to your advantage and split up your files with one rule: *One file represents a type of resource*.

> Build up a blueprint and reuse it as much as you can.

Terraform is great for modularization of infrastructure resources. Every module should follow this structure:

```
.
├── data.tf
├── default-variables.tf
├── examples
|   | ...
├── main.tf
├── outputs.tf
├── README.md
├── required-variables.tf
└── test
    | ...
```

There's no hard-coded values in here. If we need a hard-coded value, it's put into `default-variables.tf`. Every module attribute is a variable (some will be required, some may be put to default values).

This will give you the possibility of placing elements where they belong. Is your `main.tf` file longer than `X` lines? Split it up into more logical files (following the rule *One file represents a type of resourece*).

See the `examples` directory up there? This is your place for further development of your module. It will also carry some example usages of your module. Keep it as reusable as possible.

## Three Tiers to Rule Them All

----

Your cloud provider will surely publish a *terraform provider* plugin. This gives you a good point to start with - all the resources (VMs, Database instances, ...) that can be created will come with this plugin.

Using this provider plugins as-is will make you cry. Think of your three stages (development, integration, production) and think about that you'll need nearly every resource in all of those three stages. This means fully configuring a Kubernetes cluster three times (including about 70% redundancy in configuration).

### The First Tier

You will extend (or initially create) your own library of primitive building blocks. This means defining a useful terraform resource following your own needs. You know best what your VMs need to look like. You know best what guides your databases need to follow. Standardize that and put it into a primitive terraform resource.

### The Second Tier

Build services from these primitive blocks. In your final repository (containing `/dev` `/int` and `/prd` directories), the only things you want to see in your code is "I want three standard VMs following our defaults". What you don't want to care about in those directories is stuff like "My VM needs to be in the standard VPC for my project". Do you see? Everything that is "standard" should be handled "standard" and this is your second Tier.

### The Third Tier

It can't get more abstract than this. This is where you call your second-Tier services from. You throw some variables at them and they provide your whole infrastructure.

### Conclusion of Three Tiers

Think of this procedure as building your own IaaS building blocks on top of terraform and on top of the cloud provider's implementation. You know what your business needs, so you know best how your modules/services should look like.

You will shortly see which values in your terraform resources need to be put into which Tier. Everything environment-related is Third Tier. Everything else belongs to Second Tier. And every resource you create will be an atomic resource representation in First Tier.

### Example

Here's a cool graphic on what I've been talking about in this article:

<img style="margin: 16px 16px 16px 16px;" src="{{ site.baseurl }}/assets/2021-03-21-refactor-your-terraform-repository-now/00.png" title="Photo by DoIT International">

Let's say you have a MySQL instance deployed onto your cloud provider (which is stated in your `terraform-live-envs`). This is built on top of your self-written generic service called `sql` (Second Tier). This generic service builds up on the atomic resource `sql-instance` and `sql-user`.

The only thing you need to provide inside `terraform-live-envs` is that you need an instance of your self-written `sql` in an specific environment. Terraform (with your modules) will do the rest.

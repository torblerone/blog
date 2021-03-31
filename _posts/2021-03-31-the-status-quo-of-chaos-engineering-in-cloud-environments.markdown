---
layout: post
title: "The Status Quo of Chaos Engineering in Cloud Environments"
date: 2021-03-31 09:47:54 +0100
categories: 
---
Chaos Engineering is not just a job description, but a way of thinking and approach that involves the entire team. Regular "match days" with the team become a regular ritual. Each team thinks through its own requirements and selects one or more tools. A one-stop shop makes everyone in the team happy. [5]
----

To test the robustness and resilience of production systems, chaotic technical experiments in a production environment can provide much-needed insights. The frightening thought of conducting tests in production or even outside when the user traffic or strain is real (e.g. Focus on small experiments that tell you what you want to identify. It is not necessary to bring this into production in the name of science or to limit the radius of radiation, but it is a responsible practice. [0] 
    
The most difficult touchstone is the cascade of errors in chaos engineering. A cascade failure is a failure in one part of the power grid that triggers outages in other parts. In distributed systems, each of us tries to find a single fault point to ensure that our application infrastructure is robust enough to handle outages. [0] 
    
Once you become familiar with chaos experiments, you will want to embed it in your engineering culture. This is done by continuous chaos, which is the original Chaos Monkey that restarts VMs at random intervals. Once you know that Chaos Experiment exists and you decide to do so, it will be of paramount importance to the development team from the very beginning. [7] 
    
Improving service availability and longevity are two of the most important customer benefits of Chaos Engineering. Chaos tests are also excellent for the so-called "training" of engineering teams. Teams get a better understanding of system modes and dependencies, allowing them to develop more robust system designs. [1] 
    
In other words, the test team goes from known unknowns to known acquaintances. Much of chaos engineering consists of making hypotheses, proving or refuting those hypotheses by drawing as much information as possible from remote networks, including operating systems and software, which allows one to make predictions based on known vulnerabilities rather than guessing and hoping for the best. This way, the testers do not have to get blindly into a situation. As it scans your system and records KPIs such as availability and speed, IT also performs an important function in chaos engineering: remote host detection. [6] 
    
Without traces and tree trunks, it is difficult to think about monoliths. You get micro services, nice little ones doing one thing and they have a bit of an inner state all the time. They are somewhat more complex, but much better to observe than, say, a monolith. [3] 
    
I've come across this sort of thing quite often lately. It turns out that the easiest way to crack a system of web services is to have your DNS. It is an interesting problem that needs to be resolved. But she is also the weakest of them all. What happens when there is no more space to do something else? [3] 
    
A well-functioning system can be dismantled by its operators if they become confused. The Chernobyl nuclear disaster is an example of this. There are some great examples of this. These pesky users are the operators of everything. [3] 
    
In the last five years, there has only been one situation where one instance has disappeared without affecting our service. That was when Chaos Monkey itself terminated an instance that was used as redundancy. This happened during the day, not during the delivery of the service, and had little impact on our customers. It could have been much worse: the service could have been running for months in the middle of the night on a weekend, and the engineers working on it would not have been called back. [2] 
    
No single component can guarantee 100% availability, and expensive hardware can fail, but when we design cloud architectures, individual components can fail without affecting the availability of the entire system. In fact, we are stronger than our weakest link. [4] 
    
With a chaos engineering mentality, processes, chaos tests and tools, we can meet the challenge of building resilient applications and gaining confidence in our complex applications. The human factor is central to the chaos in our applications. [5] 
    
The application landscape has evolved so much over the years that conventional monitoring systems are unable to verify whether our systems are or are not. Check out the following architectures from major corporations like Amazon or Netflix. I can tell you that they are not there yet. They are represented by examples of microservices running on Amazon's web shop, AWS and its online store. [7] 
    
In recent years, we have seen a drastic change in the framework conditions and methods for software development. Monolithically, the cloud has been replaced by microservice architectures that create software at high speed. System architects and testers are in a hurry to release software, and if you find unknown conditions, you need to perform chaos engineering to distribute the changes through complex development methods. [4] 
    
The core step of chaos engineering is to predict how the system will behave when it encounters a particular error. Engineers analyze the system and select the cause of the fault. The first group controls the error injection and the second group deals with the effects. [1] 
    
The progression of queries and answers into spaghetti (also referred to as graph or fan) represents the chaos inherent in the system designed to tame chaos engineering. The entirety of the system emits reactions that need to be analyzed by humans. Some systems make sense, but there are also parts of systems that make sense. [2] 
    




---
Sources:
    
[0]: https://harness.io/blog/devops/chaos-engineering/
    
[1]: https://phoenixnap.com/blog/chaos-engineering
    
[2]: https://www.oreilly.com/content/chaos-engineering/
    
[3]: https://www.gremlin.com/blog/adrian-cockroft-chaos-engineering-what-it-is-and-where-its-going-chaos-conf-2018/
    
[4]: https://dzone.com/articles/chaos-engineering-a-comprehensive-guide
    
[5]: https://blog.qaware.de/posts/chaos-engineering-the-status-quo/
    
[6]: https://www.infoq.com/articles/chaos-engineering-security-networking/
    
[7]: https://xpirit.com/chaos-engineering-why-you-should-break-stuff-in-production-on-purpose/
    

---
layout: post
title:  "Metadata-driven Architecture"
date:   2017-6-8
---

<p class="intro"><span class="dropcap">E</span>baas is a light-weighted and high-productivity application platform. It supports a no-code and metadata-driven development approach that enables professional and nonprofessional developers to build single page applications for the enterprise rapidly</p>

Some of the challenges found in developing enterprise applications are the ability to deliver a customized solution that meets complex and specific requirements for each customer under a time and budget constraints and adapting to business changes without big efforts.

Software companies have come to realize that it isn’t a good practice to develop enterprise application in a traditional way of Implementing business logic in software due to the low-productivity nature of programming and ever-changing business requirements. The software developers have been using the metadata-driven (or model-driven) approach to describe business logic as a metadata which is external to the software code. There is a broad range of usage from a limited implementation where a few elements of an application are represented via metadata to maximum usage where the entire application is defined by metadata.

Ebaas is designed and built from the ground up based on a metadata-driven architecture (MDDA) in which all areas of data management applications are defined by models, including data model, workflow, business logic, security policy, user interface, ETL, and report.

For example, you can use the object model to define data structure of your application (classes, relationships, and attributes) as well as access control policy, methods, events and actions to events. All parts of the data model are defined as metadata. Ebaas uses a relational database to store all metadata and all application data. To optimize application performance, Ebaas keeps all application metadata in memory.

Having models as metadata is only one aspect of Ebaas, it has a variety of engines that interprets metadata to render an entire application and provides an ability to define or modify the metadata via GUI tools.

There are two different designs in MDDA, the code generation and the model interpretation. Ebaas is based model interpretation design. Model interpretation has the following advantages in comparison to code generation:

* There is a single code base which is easy to maintain and deploy. Applications are defined by models, not code.
* 	It enables changes in runtime: Ebaas allows to change the model without stopping applications.

Using Ebaas as a platform, efficiencies in application development, as well as custom modifications per customer, will become a reality. 

Ebaas has been successfully used to build solutions for some large manufacturers, including Automobile, Machinery, Renewal Energy, and Auto Parts manufacturing industries in China, in the areas of test and measurement data management, task planning and tracking, and product quality control.

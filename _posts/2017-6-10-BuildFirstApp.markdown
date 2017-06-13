---
layout: post
title:  "Build Your First Application with Ebaas"
date:   2017-6-10
visible: 1
---

<p class="intro"><span class="dropcap">T</span>his tutorial describes how to build a simple application that tracks the assignment, status, and progress of issues related to a project. This tutorial walks you through all the steps necessary to build a functional issue tracking application. After completing this tutorial, you will be able to understand the fundamentals of how to use Ebaas through hands-on experience. </p>

## Set up the Ebaas

To walk through the tutorial, you need to install Ebaas on your computer. The system requirements are following:

*	Windows 10 (64bit)
*	Microsoft.Net Framework 4.5.2
*	Google Chrome, Windows Edge, or IE 11

Step 1:	Download Ebaas software from <a class="post-link" href="https://ebaas.github.io/download/">here</a>.
Step 2:	Install the downloaded software following the <a class="post-link" href="https://ebaas.github.io/blog/InstallEbassHelp/">steps</a>.

## Issue class details

The Issue class is similar to a table in the database terminology. Since a data model in Ebaas is object-oriented. We will use the terminology like Class, Attribute, Instance, etc.    Depending on application requirements, an issue class can have lots of attributes to describe the nature and state of an issue. But for the simplicity, we will only define the following properties of the Issue class (Table 1) in this tutorial.

Table 1: Properties of the Issue class

| User Name | Password | User Role |
|-------|--------|---------|
| demo1 | 888 | Administrator |
| demo2 | 888 | Lab manager |
| demo3 | 888 | Lab operator |



---
layout: post
title:  "Installation of Ebaas"
date:   2017-6-2
---

<p class="intro"><span class="dropcap">E</span>baas is an enterprise application for Testing Data Management (TDM). Testing Data Management software in product testing fields can shorten the product test cycle, lower test costs, accelerate market-to-market. </p>

<p>In this post, you will find the instructions for installing the Ebaas (out-of-the-box version), launching the application server, and log in using one of the demo accounts. If you ran into problems, please refer to "Troubleshooting" page for possible solutions.</p>

## Installation Requirements

First of all, please make sure your installation environment meets the following requirements.

* Your computer is using Windows 10 (64bit)
* Your computer has installed Microsoft.Net Framework 4.5.2
* Your computer has one of the web browsers, such as Google Chrome,  Windows Edge, or IE 11

## Installations

Download the Ebaas setup from <a class="post-link" href="https://ebaas.github.io/download/">here</a>, run the downloaded setup file as the Administrator, follow the steps until the installation is complete. The out-of-the-box version has an embedded SQL Server Compact database, therefore, you don't need to install a database.

## Launch Application Server

Find the command at Start->Ebaas->StartServer and click on the command to launch the application server. Please run the command as the administrator on Windows 7 or Windows 10, and You will see the command windows shown in Figure 1 if the application server started successfully. To stop the application server, just close the command window.

<img src="{{'/assets/img/2017-06-01-Fig1.png' | prepend: site.baseurl }}" alt="">

Figure1. - Application Server Window

## Getting Started

To get started, open one of the recommended web browsers to connect to the application server at <code>http://localhost:8080</code>.  The login page should appear shown in Figure 2.  You can use any of the following demo user accounts to log in and explore the features of Ebaas.

| User Name | Password | User Role |
|-------|--------|---------|
| demo1 | 888 | Administrator |
| demo2 | 888 | Lab manager |
| demo3 | 888 | Lab operator |

<img src="{{'/assets/img/2017-06-01-Fig2.png' | prepend: site.baseurl }}" alt="">

Figure2. - Login page

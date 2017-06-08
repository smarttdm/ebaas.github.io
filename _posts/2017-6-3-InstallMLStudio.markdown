---
layout: post
title:  "Installation of ML Studio"
date:   2017-6-3
---

<p class="intro"><span class="dropcap">M</span>L Studio is a GUI tool that provides a modeling environment for deep learning. It simplifies the process of developing deep learning models.</p>

<p>This post will walk you through the steps of setting up the ML Studio software and related frameworks on your computer. </p>

## Installation Requirements

First of all, please make sure your computer meets the following requirements.

* Your computer is running Windows 10 (64 bit)
* Your computer has installed Microsoft.Net Framework 4.5.2
* Your computer has one of the web browsers, such as Google Chrome, Windows Edge, or IE 11

## CNTK Setup

ML Studio currently uses the Microsoft Cognitive Toolkit (CNTK 2.0) as its deep learning framework. You should first install the CNTK 2.0 release on your computer. There are several approaches for setting up CNTK on your computer, I recommend the script-driven installation approach, which is simpler.

The instruction of using the script-driven installation is <a class="post-link" href="https://docs.microsoft.com/en-us/cognitive-toolkit/setup-windows-binary-script">here</a>. It will walk you through the process of installing the CNTK 2.0 for Windows based on a binary distribution.

<b>Note: You must unpack the downloaded zip file into the folder <code>c:\local\CNTK-2-0</code></b>

ML Studio utilizes the Google Tensorboard for visualizing the result of training and testing models. To enable this feature, you should install Tensorflow for Windows on your computer in which the Tensorboard is one of the components.

## ML Studio Setup

Download ML Studio setup from <a class="post-link" href="https://ebaas.github.io/download/">here</a>, run the downloaded ML Studio setup, follow the steps until the installation is complete. Then, launch the ML Studio by clicking the ML Studio icon on your desktop.

## Examples

The best way to experiment the ML Studio is to open one of examples located at <code>C:\Program Files\Ebaas\MLStudio\Examples</code>, assuming you installed the software on the default path.

<img src="{{'/assets/img/2017-06-06-Fig5.png' | prepend: site.baseurl }}" alt="">
Figure1. - ML Studio Tool loaded with an example

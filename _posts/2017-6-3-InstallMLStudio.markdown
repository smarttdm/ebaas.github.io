---
layout: post
title:  "Installation of ML Studio"
date:   2017-6-3
---

<p class="intro"><span class="dropcap">M</span>L Studio is a GUI tool that provides a modeling environment for deep learning. It simplifies the process of developing deep learning models.</p>

<p>In this post will walk you through the steps of setting up the ML Studio software and related frameworks on your computer. </p>

## Installation Requirements

First of all, please make sure your computer meets the following requirements.

* Your computer is running Windows 10 (x64)
* Your computer has installed Microsoft.Net Framework 4.5.2
* Your computer has one of the web browsers, such as Google Chrome, Windows Edge, or IE 11

## CNTK Setup

ML Studio currently uses the Microsoft Cognitive Toolkit (CNTK 2.0) as its deep learning framework. You should first install the CNTK on your computer. There are several approaches for setting up CNTK on your computer, I recommend the script-driven installation approach, which is easier.

The instruction of using the script-driven installation is <a class="post-link" href="https://docs.microsoft.com/en-us/cognitive-toolkit/setup-windows-binary-script">here</a>. It will walk you through the process of installing the Microsoft Cognitive Toolkit (CNTK) for Windows based on a binary distribution.

ML Studio utilizes the Google Tensorboard for visualizing the result of training and testing models. To enable this feature, you should install Tensorflow for Windows on your computer in which the Tensorboard is one of the components.

## ML Studio Setup

Run the downloaded MLStudio _x64_1.0.0_Setup.msi, follow the steps until the installation is complete. Then, launch the ML Studio by clicking the ML Studio icon on your desktop.

## License

Copyright (c) 2017 Yong Zhang

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

---
layout: post
title:  "Introduction to ML Studio"
date:   2017-6-7
visible: 1
---

<p class="intro"><span class="dropcap">M</span>L Studio is an interactive, GUI-based tool you can use to build, test, and deploy deep learning models from your data. ML Studio publishes models as web services on Ebaas platform that can easily be consumed by a custom application built on Ebaas.</p>

To develop a deep learning model for predictive analysis, you typically have data from the sources like database or applications, you need to have a preprocess module that transforms that data through various data manipulation and statistical functions, and generate a set of data for training, testing, and validation. Then you build a deep learning model, modify the various functions and their parameters, train the model until you are satisfied that you have an effective model. You probably need to have a post-process module that transforms output of the model to a high-level representation. Developing a model like this is an iterative process which is illustrated by the following flowchart:

<img src="{{'/assets/img/2017-06-06-flowchart.png' | prepend: site.baseurl }}" alt="">

Not only it takes many steps, but it also has many files involved in the process, including original data files, training/testing/evaluation data files, model output files, and post-processed files. Furthermore, the model training steps is an iterative process that requires constant tuning of learning algorithm parameters. Finally, deploying the trained model into use is also an arduous task. 

In a corporate environment, we are talking about the possibility of developing hundreds of models by users in different business units. It will become tremendous challenging and error-prone task without using a tool.
ML Studio allows you to focus on aspects of defining and optimizing models without doing all the tedious jobs. Here are some of the features that ML Studio offers:

* Create or open modeling experiment templates: an experiment template contains steps of a modeling process, including data pre-processing, model definition, learning parameter setting, and data post-processing.
* Create or modify a template by drag and drop components, and setting component’s parameters. Then save the template as a local file.
* Execute actions of pre-processing, training, testing, validating model, and post-processing.
* Parallelly experiment models with different functions or learning parameters.
* Visualize converged results using Tensorboard.
* Manage and view data files and scripts associated with the model.
* Deploy a trained model to Ebaas server as a web service.

The main workspace of the ML Studio is shown in Fig 1, in which a template for developing a model is in the middle, the components of a template are to the left, and the settings of a selected component in the template are to the right.

<img src="{{'/assets/img/2017-06-06-Fig5.png' | prepend: site.baseurl }}" alt="">
Figure1. - ML Studio Workspace

ML Studio is integrated with Google’s Tensorboard which allow you to view, compare, and analyze models. As shown in Figure 2, Tensorboard displays the converged results of two models in a parallel experiment.

<img src="{{'/assets/img/2017-06-06-Fig6.png' | prepend: site.baseurl }}" alt="">
Figure2. - Tensorboard’s comparison of model results

Once you are satisfied with the model performance, you can use ML Studio to publish trained models to Ebaas application server. You perform the deployment process by using a wizard which uploads the model file and related scripts to the server and creates meta-data describing the model. Figure 3 shows the final step of the deployment wizard for a battery RUL predictive model.

<img src="{{'/assets/img/2017-06-06-Fig7.png' | prepend: site.baseurl }}" alt="">

Figure3. - Model Deployment Wizard

ML Studio currently uses the Microsoft Cognitive Toolkit (CNTK 2.0) as its deep learning framework. You should first install the CNTK 2.0 release on your computer. 

CNTK, developed by Microsoft, is one of the major open source deep learning frameworks. As of this writing, it’s current release is 2.0 rc3. CNTK supports many types of deep learning networks, including multi-layered Neural Network, CNN, RNN, LSTM and Seq2Seq. CNTK allows defining neural network models using Python language and a configuration script, called BrainScript. CNTK’s BrainScript is relatively easy to use for beginners or those who are not familiar with Python programming.

ML Studio, together with Ebaas platform, provides a complete environment where you can get a head start on applying machine learning technology to your business.

Figure 4 shows an use scenario of Ebaas and ML Studio in a business environment.
<img src="{{'/assets/img/2017-06-06-Fig10.png' | prepend: site.baseurl }}" alt="">
Figure4. - Use Scenario

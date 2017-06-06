---
layout: post
title:  "Implementation of Li-ion Battery RUL Prediction using LSTM"
date:   2017-6-6
---

<p class="intro"><span class="dropcap">D</span>eep learning is the study of artificial neural networks and related machine learning algorithms that contain more than one hidden layer. Deep learning networks, such as deep feed forward network(DFF), convolution neural network(CNN), recurrent neural network(RNN), long-short term memory (LSTM), and sequence to sequence (Seq2Seq) have been applied to computer vision, speech recognition, natural language processing,  and audio recognition  fields, etc. and have achieved excellent results.</p>

In this post, I would like to present a case where I apply deep learning for a business problem. The particular application of deep learning in this post is using LSTM, which is a type of recurrent neural network, to predict Li-ion battery remaining useful life(RUL).

Deep learning can be solutions to many of problems in enterprises. Like any new technology, it will be a slow process for businesses to adopt deep learning technology. At present, some of the biggest problems faced by businesses in adopting deep learning, or machine learning in general, are following:
* Machine learning requires having high quality and structured data sets. To take advantage of machine learning, enterprises must first establish a standardized data management system.
* Shortage of Machine learning talents. Hiring data scientists is hard, and hiring data scientists with business domain knowledge is even more difficult. 
* Lack of necessary products and tools. Although there are many open source deep learning frameworks, for example, Tensorflow, Caffe, CNTK and Keras, etc., but the learning curve is high. Most of the frameworks focus on building deep learning models and do not provide a solution as to how to deploy and use of models. It is still up to enterprises to develop what is lacking, making the development, deployment and use of deep learning a long cycle.

In this post, I will address the above issues by introducing some of the work I have done in past years and recently. Here, I am using Li-ion battery RUL prediction as an example to demonstrate the software that I have developed. 

There are many research on Li-ion battery RUL prediction using various techniques and algorithms. But the focus here is not on the accuracy of predicting model, but rather on design and implementation of a software system that makes it easy for businesses to apply deep learning to test data from the experiments.


## The Problem

Li-ion batteries are widely used in consumer electronics, electric vehicles and space systems. However, a Li-ion battery has a useful life, that means with continuous charge and discharge cycles and material aging, battery performance will continue to decline until it fails to function.

Remaining life of a Li-ion battery is also known as battery cycle life, refer to the number of complete charge/discharge cycles that the battery can support before that its capacity falls under 70% of its original capacity. 

It is known that capacity of a Li-ion battery is continuously declining after every charge and discharge cycle, and the degradation trend is very consistent. When a battery capacity drops under the failure threshold, the cell is considered to be not useable. Theoretically, it is possible to predict the remaining life of a Li-ion battery by establishing a life model of a battery. A battery life model can have many applications.

Many companies and research institutions have been conducting research and development of Battery Management Systems (BMS) for electric vehicles, ships, aircraft and spacecraft, in which the battery life model is an essential component and one of the challenges in developing BMS.

Many of mission-critical devices, such as GPS systems and satellites, use Li-ion batteries as the power source. Therefore, a battery life model is important for assessing the reliability of Li-ion batteries during operation of the devices.

Manufacturers of Li-ion batteries are required to perform many kinds of tests, including battery cycle life and calendar life tests, to ensure the reliability of Li-ion batteries, which are very time-consuming and costly. By using battery life models to predict remaining battery life, companies can shorten the test time by 20%.

The industry has been conducting research in establishing battery life model that can accurately predict remaining life of batteries. The methods vary from using battery physical model and data-driven model. Recently, machine learning techniques have been a trend in research, including the use of SVM, ANN, and RNN, etc. 

However, the primary focus of the research has been on choosing modeling methods and algorithms to improve the accuracy of prediction, and the MATLAB tool has been used to implement the models.

Deep learning has shown very promising results in many fields, but the use of open source deep learning framework for Li-ion battery RUL prediction has just begun. The steep learning curve of deep learning frameworks and lack of application platform and tools for simplifying the development and deployment of deep learning models have been obstacles to the progress.

## Solution Overview

The solution that I have been working on consists of the following approaches:

First of all, I considered Li-ion battery RUL prediction as a time series problem. Unlike regression predictive modeling, time series also adds the complexity of a sequence dependence among the input variables. A type of neural network designed to handle sequence dependence is called LSTM (Long Short-Term Memory).

In my solution, I choose to develop LSTM networks using the CNTK framework, an open source deep learning framework developed by Microsoft. 

Secondly, among battery cycle life data I have, I used the capacity/cycle data sequence as time series to train and test the LSTM model.
Then, the trained model is deployed to an application server, and prediction of battery RUL can be performed on a web-based production environment.

To facilitate the process of collecting data, preprocessing data, developing an optimized model, deploying the model, and use of the model, I have developed a software platform and tools as an integrated environment to make the process as smooth as possible.
Although I am using battery RUL prediction as an example to demonstrate this environment, it can be used to accomplish other types of tasks involving machine learning.

Following, I will introduce the solution in detail based on the process, generally divided into the following sections:

* Collecting and preprocessing data for training model
* Developing, testing and deploying the model
* Performing battery RUL prediction using model

## Data collection and Preprocessing

For demo purpose, I have used a set of cycle life test data of Li-ion batteries provided by PCoE (NASA Prognostic Center of Excellence, PCoE) for public use.

 A set of test data for Li-ion battery is used in this example is a result of testing four Li-ion batteries (B5, B6, B 7 and B 18). The tests are carried out at room temperature for three different operating conditions (charging, discharging, and impedance measurements). The data is compressed in the format of MATLAB file (*.mat).

Figure 1 shows capacity changes of the battery (B5) over the charge-discharge cycles.

 
 <img src="{{'/assets/img/2017-06-06-Fig1.png' | prepend: site.baseurl }}" alt="">
Figure1. - Cycle capacity degradation curve of a Li-ion battery
 
The capacity degradation data for four batteries is collected as a time series set and is used for training and testing an LSTM model so that the trained model can be used to predict the remaining cycles. Since the NASA’s battery measurement data files are binary compressed files and contain more data than what is needed, I wrote a converter in C# that reads data from a MATLAB file, filters data, and outputs filtered data as time series matrix in which each row is a cycle (Figure 3).

Test data may come in with a variety of file formats, such as CSV, Excel, or other file formats. Even with the same file format, the structure of data content and the naming conventions are usually different. Therefore, converting raw test data into standard and usable data is a tedious and complicated process.

To deal with the problem, one of the primary features in the Smart TDM is to automate data processing process that can deal with discrepancies of test data in their original formats. I will describe the implementation of the data processing automation in other posts. The main idea is to enable users to upload test data files using a web browser and let the system do the dirty work of processing data, without any manual intervention.

Smart TDM is a SPA (Single Page Application) application that I have developed. Its front-end is implemented with HTML5, JavaScript, AngularJS, and Bootstrap. Its back-end is an application server implemented with .net framework. The application server provides RESTFUL API as services to the front-end or other clients. Smart TDM can work with different relational databases, such as SQL Server Compact Edition, SQL Server and Oracle. Smart TDM is designed to be a software platform for Test Data Management (TDM). It has a wealth of features that I will introduce in follow-up posts.

For our battery RUL prediction example, we first need to create a test item instance, called Li-ion battery cycle life test, in Smart TDM and then upload the four battery test files as a test result to the server as shown in Figure 2.

<img src="{{'/assets/img/2017-06-06-Fig2.png' | prepend: site.baseurl }}" alt="">
Figure2. - Upload the Li-ion battery test data files

Upon the files are uploaded, the server will process the files automatically based on a pre-configured data preprocessing workflow, and then displays the structured test data in a table (Figure 3).

<img src="{{'/assets/img/2017-06-06-Fig3.png' | prepend: site.baseurl }}" alt="">
Figure3. - Li-ion battery structured test data

For our battery RUL prediction purpose, we only need to collect the battery capacity data as time series. Figure 4 shows a collection of time series of capacity data for the four batteries.

<img src="{{'/assets/img/2017-06-06-Fig4.png' | prepend: site.baseurl }}" alt="">
Figure4. - Li-ion battery capacity time series data set

Although we can collect more battery data in the data set, for the demo, only data from the four batteries is used for developing a model. Let’s download the data set as a text file (view data here). We will use this it as an example to train and test an LSTM model in the next section. 

## Developing, Testing and Deploying Model

CNTK, developed by Microsoft, is one of the major open source deep learning frameworks. As of this writing, it’s current release is 2.0 rc3. CNTK supports many types of deep learning networks, including multi-layered Neural Network, CNN, RNN, LSTM and Seq2Seq. CNTK allows defining neural network models using Python language and a configuration script, called BrainScript. CNTK’s BrainScript is relatively easy to use for beginners or those who are not familiar with Python programming. In this post, I am going to use BrainScript to define an LSTM model.

Developing a neural network model is usually a complicated process. The following flowchart illustrates the steps in the process.

<img src="{{'/assets/img/2017-06-06-flowchart.png' | prepend: site.baseurl }}" alt="">

Not only it takes multiple steps, but it also has many files involved in the process, including a time series data file, training/testing/evaluation data files, model output file, and a predicted time series file. Furthermore, the model training steps is an iterative process that requires constant tuning of learning algorithm parameters. Finally, deploying the trained model into use is also an arduous task. 

In a complex business environment, we are talking about the possibility of developing hundreds of models by users in different business units. It will become tremendous challenging and error-prone task without a tool.

To simplify the process of developing models, I developed a tool, called ML Studio (Machine Learning Studio). ML Studio is a GUI tool that provides a modeling environment for deep learning. It allows users to focus on aspects of specifying and optimizing models without doing all the tedious jobs. Here are some of the features that ML Studio offers:

* Create or open modeling process templates: a template contains steps of a modeling process, including data pre-processing, model definition, learning parameter setting, and data post-processing;
* Create or modify a template by drag and drop components, and setting component’s parameters. Then save the template as a local file;
* Execute actions of pre-processing, training, testing, validating model, and post-processing;
* Compare models with different definition or learning parameters using Tensorboard;
* Manage and view data files and scripts associated with the model;
* Deploy a trained model to Smart TDM server as a service;

As demonstrated in Figure 5, it is the main screen of the ML Studio, in which a process template is in the middle, the components of templates are to the left, and the settings of a selected component in the template are to the right.

<img src="{{'/assets/img/2017-06-06-Fig5.png' | prepend: site.baseurl }}" alt="">
Figure5. - ML Studio Tool

For our example of battery RUL prediction, I created a template with a parallel component (shown in Figure 5) so that I can have two LSTM models with different configurations which help me to experiment different settings and discover optimized training parameters.

I have integrated ML Studio with Google’s Tensorboard which allow you to view, compare, and analyze models in ML Studio. As shown in Figure 6, Tensorboard displays the testing result of two LSTM models in my experiment.

<img src="{{'/assets/img/2017-06-06-Fig6.png' | prepend: site.baseurl }}" alt="">
Figure6. - Tensorboard’s comparison of model test results
 
Once you are satisfied with the model performance, you can use ML Studio to publish trained models to Smart TDM application server. The deployment process is done by using a wizard which uploads the model file and related scripts to the server and creates meta-data describing the model. Figure 7 shows the final step of the deployment wizard for our battery RUL prediction model.

<img src="{{'/assets/img/2017-06-06-Fig7.png' | prepend: site.baseurl }}" alt="">
Figure7. - Model Deployment Wizard

## Performing battery RUL prediction using model

Once the model is deployed on the server, it is easy to carry out a battery RUL task using the model. You just need to open a web browser, log in to your Smart TDM account, find the test item instance for the battery cycle life, step into the "Data Chart" view where you can click on "Forecast” button and see the predicted data graphically, as shown in Figure 8. 

The line with blue dots shows the battery capacities in the past cycles, and line with red dots shows the remaining ones of future cycles predicted by the model.

<img src="{{'/assets/img/2017-06-06-Fig8.png' | prepend: site.baseurl }}" alt="">
Figure8. - Predicting the remaining cycle capacities of a Li-ion battery

Since Smart TDM may have many models deployed, you may wonder how it knows which model to use when predicting a battery RUL? It is because there is a binding between a test item instance with a model, and the binding is described in term of meta-data created when the model is deployed. 

## Summary

So far, I have demonstrated the whole process of developing and applying an LSTM model to the problem of Li-ion battery RUL prediction, using Smart TDM software and ML Studio tool that I developed. Lots of details are omitted to keep the post short. I plan to write posts to offer more information. 

Although machine learning can be used in many fields in businesses, my focus has been applying machine learning technology in solving the problems in product testing or experiment area. Machine learning can potentially apply to various fields, including product reliability evaluations, predicting testing results, preventing repeat test tasks, etc. The battery RUL prediction is just an example of the many applications.

In short, applications of machine learning technology in product test field can shorten the product test cycle, reduce test costs, accelerate market-to-market.

If you are interested in trying out the software I used in this post, you can download the free version of Smart TDM and ML Studio from the “Download” page. 

The working environment for this post consists of following software and tools:

* Microsoft Windows 10
* Microsoft.Net Framework 4.5.2
* Microsoft CNTK 2.0 rc2
* Smart TDM 7.1.0 (Download here)
* ML Studio 1.0.0 (Download here)
* Microsoft SQL Server Compact Edition (Embedded in Smart TDM)

Figure 9 shows the role that each piece of software plays in a whole picture.
<img src="{{'/assets/img/2017-06-06-Fig9.png' | prepend: site.baseurl }}" alt="">
Figure9. - Use Scenario

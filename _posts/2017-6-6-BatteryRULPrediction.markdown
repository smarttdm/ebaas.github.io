
---
layout: post
title:  "Implementation of Li-ion Battery RUL Prediction using LSTM"
date:   2017-6-6
---

<p class="intro"><span class="dropcap">D</span>eep learning is the study of artificial neural networks and related machine learning algorithms that contain more than one hidden layer. There are several deep learning networks, such as deep feed forward network(DFF),convolution neural network(CNN), recurrent neural network(RNN), long-short term memory (LSTM), and sequence to sequence (Seq2Seq) has been applied to computer vision, speech recognition, natural language processing, audio recognition and bioinformatics fields, etc. and have achieved excellent results.</p>

In this post, I would like to present a case where deep learning is applied to solving a problem in enterprises. The specific application of deep learning in this post is using LSTM, which is a type of recurrent neural network, to predict Li-ion remaining useful life(RUL).

Deep learning can be solutions to many of problems in enterprises. Like any new technology, it will be slow process for enterprises to adopt deep learning technology. At present, some of the main problems faced by enterprises in adopting deep learning, or machine learning in general, are following:
* Machine learning requires to have high quality and structured data sets. To take advantage of machine learning, enterprises must first establish a standardized data management system
* Shortage of Machine learning talents. Hiring data scientists is hard, and hiring data scientists with business domain knowledge is even harder
* Lack of necessary products and tools. Although there are many open source deep learning frameworks, for example, Tensorflow, Caffe, CNTK and Keras, etc., but learning curve is high. Most of the frameworks focus on building deep learning models and do not provide a solution as to how to deploy and use of models. It is still up to enterprises to develop what is lacking, making the development, deployment and use of deep learning a long cycle.


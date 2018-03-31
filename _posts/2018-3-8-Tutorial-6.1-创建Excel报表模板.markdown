---
layout: post
title:  "创建Excel报表模板"
date:   2018-03-08
visible: 1
---

这个教程，我们将使用Excel创建一个“事务”报表模板。

<img src="{{'/assets/img/2018-3-7-Excel的XML映射例子.png' | prepend: site.baseurl }}" alt=""><br>

Ebaas平台就是应用了Excel的这个XML与单元格映射关系的功能来实现报表的自动生成功能。创建一个具有XML映射关系报表的第一步是要定义该XML的架构（XML Schema）。XML架构反映了数据的结构及关系。

{% include note.html content="说明" %}

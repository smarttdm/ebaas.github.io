---
layout: post
title:  "配置Excel报表数据源XML架构"
date:   2018-03-07
visible: 1
---

前面教程我们介绍了将数据类的数据实例导出为Excel文件的配置方法。导出的是二维表格的格式。在实际应用中，有许多依据数据生成特殊格式Excel报表的需求，其中报表格式需要进行设计和排版，支持图表显示以及数据统计的计算。为此，Ebaas平台提供了基于Excel模板的报表生成及导出功能。这里，我们将以生成一个简单的“事务”表格为例，介绍如何配置和使用这个功能。

Excel是大家常用的制表工具，具有强大的功能。制作一个Excel报表主要包括两部分的工作，一是设计显示格式，二是填入业务数据。很多情况下，业务数据是保存外部文件或数据库中，例如，XML文件中。为了支持从外部XML文件读取数据，Excel提供了将XML架构（XML Schema）元素映射到表格中单元格的功能。一旦建立了映射关系，就能方便地将XML数据自动填充到设计好的表格中快速生成报表。如下图所示：

<img src="{{'/assets/img/2018-3-7-Excel的XML映射例子.png' | prepend: site.baseurl }}" alt="">

{% include note.html content="需要确认Excel打开了XML功能" %}

Ebaas平台就是应用了Excel的这个XML架构与单元格映射关系的功能来实现报表的自动生成功能。创建一个具有XML映射关系报表的第一步是要定义报表所使用的XML架构（XML Schema）。XML架构反映了数据的结构及关系。

#### 创建XML架构

* 从“开始”菜单 => Ebaas => DesignStudio => 打开DesignStudio工具；
* 选择“事务跟踪管理”数据库 => 登录为admin用户（密码：admin）;
* 在左边的导航栏中选择“XML架构”节点 => 右键菜单点击“创建”；
* 在弹出的“添加新客体”窗口中 => 输入名称：IssueXML，输入显示名：事务XML架构 （见下图） => 确认；

<img src="{{'/assets/img/2018-3-7-事务XML架构名称.png' | prepend: site.baseurl }}" alt="">

之后，弹出“创建或修改XML架构向导”。按照下面的步骤进行定义。

* 每个XML架构需要有一个根类型。所以首先确定XML架构的根类型，点击“根类型”的右边的"..."按键，从弹出的窗口中选择“事务”数据类。结果如下图：

<img src="{{'/assets/img/2018-3-7-定义事务XML架构第一步.png' | prepend: site.baseurl }}" alt="">

* 点击“下一步”进入第二步。这一步构建XML架构包含的数据类型。我们可以在“事务”这个根类型下添加相关的数据类型；
* 从左边显示的“关联数据类”中选择“意见” => 点击中间的箭头 => 将“意见”数据类添加为XML架构的子元素。见下图；

<img src="{{'/assets/img/2018-3-7-定义事务XML架构第二步.png' | prepend: site.baseurl }}" alt="">

* 点击“下一步”进入第三步。这一步构建XML架构中数据类型所包含的属性；
* 左边点击“意见”数据类型节点 => 可以看到右边列表中已经有“提交人”和“提交时间”属性；
* 点击下方“添加”按键，从弹出的窗口中选择“内容”属性 => 确认。将“内容”属性添加到XML架构的“事务”数据类型中。见下图；

<img src="{{'/assets/img/2018-3-7-定义事务XML架构第三步.png' | prepend: site.baseurl }}" alt="">

{% include note.html content="由于‘内容’属性的用途为‘Excluded’，所以没有自动添加到XML架构中。" %}

* 点击“下一步”进入第四步。这一步确认XML数据的来源；
* 保持默认的“数据库”选项，表示数据来自于数据库 => 点击下方的“完成”。 见下图；

<img src="{{'/assets/img/2018-3-7-定义事务XML架构第四步.png' | prepend: site.baseurl }}" alt="">

* 创建XML架构完毕，保存到数据库。

<img src="{{'/assets/img/2018-3-7-保存事务XML架构.png' | prepend: site.baseurl }}" alt="">

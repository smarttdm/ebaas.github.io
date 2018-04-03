---
layout: post
title:  "创建Excel报表模板"
date:   2018-03-08
visible: 1
---

上一个教程，我们使用DesignStudio工具创建了一个XML架构。这里，我们将使用Excel创建一个“事务”报表模板，并使用所创建的XML架构建立XML元素到模板单元格的映射关系。

为了方便Excel从Ebaas数据库中加载XML架构元数据，Ebaas平台提供了一个称为SmartExcel的工具。SmartExcel是在微软的Excel中嵌入了一个UI组件。该UI组件显示在Excel表格右方的任务面板（Task Pane）中，用于访问Ebaas的数据库以获得XML架构信息。

要使用SmartExcel工具，必须在本机安装微软Office。建议安装Office 2013及以上的版本。

#### 打开SmartExcel工具

* 从“开始"菜单 => Ebaas => SmartExcel打开SmartExcel工具。正常情况下，打开的Excel右边应出现如下图所示的任务窗口；

<img src="{{'/assets/img/2018-3-8-打开SmartExcel.png' | prepend: site.baseurl }}" alt="">

{% include note.html content="如果没有出现任务窗口，可以尝试在‘视图’菜单下打开任务面板" %}

* 点击任务面板上端的“数据库”下拉菜单 => 弹出登陆窗口 => 登陆为系统管理员（用户：admin 密码： admin);

#### 加载XML架构

* 从“数据库”下拉菜单中选择“事务跟踪管理 1.0”数据库；
* 在下方的数据模型中选择“事务”数据类。“事务”数据类的XML架构会显示在下方的列表中；
* 选择“事务XML架构”。这个XML架构是上个教程的创建的XML架构

<img src="{{'/assets/img/2018-3-8-加载事务XML架构.png' | prepend: site.baseurl }}" alt="">

* 最后点击“加载及显示XML”按键 => Excel打开“XML源”窗口显示“事务XML架构”的结构，见下图；

<img src="{{'/assets/img/2018-3-8-显示事务XML架构.png' | prepend: site.baseurl }}" alt="">

{% include note.html content="如果XML源窗口没有显示，可能是‘开发者工具’功能没有打开。可以打开‘开发者工具’后再点击按键。" %}

#### 定义报告格式及XML映射


<img src="{{'/assets/img/2018-3-8-CreateMappings.png' | prepend: site.baseurl }}" alt="">

测试报告生成

<img src="{{'/assets/img/2018-3-8-测试报告生成.png' | prepend: site.baseurl }}" alt="">

另存模板为普通Excel文件

<img src="{{'/assets/img/2018-3-8-另存为Excel模板.png' | prepend: site.baseurl }}" alt="">

保存为Excel文件

<img src="{{'/assets/img/2018-3-8-另存为普通Excel文件.png' | prepend: site.baseurl }}" alt="">



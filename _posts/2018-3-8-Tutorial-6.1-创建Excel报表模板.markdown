---
layout: post
title:  "创建Excel报表模板"
date:   2020-05-08
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

* 首先，使用Excel的功能定义报表的排版。下图所示的报表是一个例子，它包含了“事务”的表头和“事务”相关的“意见”二维列表。报表的格式可以完全根据需求来定制。
* 而后，从“XML源”中拖拽相应的XML元素到表格中的特定单元格，生成映射。

<img src="{{'/assets/img/2018-3-8-CreateMappings.png' | prepend: site.baseurl }}" alt="">

{% include note.html content="复杂的报表会有图形和统计数据显示的要求。针对这类的报表，可以将XML元素映射到第二个工作簿中，再通过编写宏的脚本进行计算并将显示结果写入第一个工作簿中，形成动态的报表。Ebaas服务器会自动执行所编写的宏来生成报表。" %}

#### 测试报表生成

您可以在SmartExcel中测试一下所设计的报表生成的结果。

* 点击“显示数据实例”按键，会在下方显示从数据库获取的“事务”数据实例；
* 选择一条数据实例后，点击底部的“加载XML”按键 => 选择的数据实例及相关数据会显示在单元格中。见下图。

<img src="{{'/assets/img/2018-3-8-测试报告生成.png' | prepend: site.baseurl }}" alt="">

如果测试有问题，需要修复问题。否则可以进行保存模板的步骤。

#### 保存SmartExcel报表模板

我们需要保存两种类型的模板，一种是SmartExcel模板，另一种是普通Excel模板。

SmartExcel模板因为应用了产品的DLL库，所以可以用SmartExcel打开。打开后会在右边显示任务窗口，可以修改XML与单元格的映射。

普通Excel模板不使用产品的DLL库，所以打开后不会出现右边的任务窗口。主要用于部署到Ebaas服务器端生成报表的用途。

为了便于后续对模板进行修改，建议先将模板保存为SmartExcel模板，具体步骤如下：

* 点击Excel文件菜单下的“另存为”菜单 => 将文件名改为“事务报表” => 点击“保存”按键。

{% include important.html content="SmartExcel模板必须保存在C:\Program Files\Ebaas\bin目录下。否则打开会报错，因为找不到所链接的产品的DLL文件。" %}

#### 保存普通Excel报表模板

保存模板为普通Excel文件需要点击右上角的“关闭”按键，点击后任务窗口会消失。见下图。 

<img src="{{'/assets/img/2018-3-8-另存为Excel模板.png' | prepend: site.baseurl }}" alt="">

然后，再使用Excel的“另存为”将模板保存为一个Excel文件，名称为："事务报告模板.xlsx"。这个保存的文件就是普通Excel模板了。普通Excel模板可以保存到任意目录下，见下图。

<img src="{{'/assets/img/2018-3-8-另存为普通Excel文件.png' | prepend: site.baseurl }}" alt="">

下一个教程介绍如何将普通Excel模板部署到Ebaas服务器上，并在Web界面使用报表生成的功能。



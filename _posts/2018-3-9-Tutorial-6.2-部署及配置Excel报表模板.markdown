---
layout: post
title:  "部署及配置Excel报表模板"
date:   2018-03-09
visible: 1
---

#### 部署Excel模板

将上一个教程保存的普通Excel模板文件手工复制到下图所示的目录下。如果第一次部署模板，部分目录路径不存在，需要手工创建后再将模板文件复制粘贴进去。

<img src="{{'/assets/img/2018-3-9-模板存放目录.png' | prepend: site.b。seurl }}" alt=""><br>

报表模板存放目录的定义如下：

{% highlight ruby %}
C:\Program Files\Ebaas\Templates\Reports\{数据库名称 1.0}\{数据类英文名}
{% endhighlight %}

#### 创建“生成报告”定制命令

使用SiteMapStudio为“事务”数据类创建一个“生成报告”的定制命令，步骤如下：

* 从“开始”菜单 => Ebaas => SiteMapStudio打开SiteMapStudio工具 => 登录为系统管理员；
* 右键点击“事务跟踪管理”下的“事务命令组”节点 => 在弹出的“菜单”中选择“添加” => 在弹出的“添加新项”名称栏输入：Report => 确定”;
* 选择新创建的“Report”定制命令，在“设置”选项卡中按照下表的参数进行设置：

| 设置参数名 | 设置参数值 | 描述 |
|-------|--------|---------|
| 名称 | Report | 定制命令的名称，必须是唯一的 |
| 显示名 | 生成报告 | 定制命令在用户界面显示的名称 |
| 模块URL | .report | 定制命令使用的界面模块，该模块是生成报告的模块 |
| 图标名称 | fa fa-lg fa-file-excel-o | 定制命令显示的图标 |

点击“模块参数”右边“...”按钮 => 在弹出的“定义参数”框中点击“添加”按钮 => 按照下表设置参数：

| 设置参数名 | 设置参数值 | 描述 |
|-------|--------|---------|
| template | 事务报告模板.xlsx | 指定生成报告的Excel模板 |

配置结果如下图所示：

<img src="{{'/assets/img/2018-3-9-创建生成报告定制命令.png' | prepend: site.baseurl }}" alt=""><br>

点击“文件” => 选择“保存”。

{% include important.html content="保存后请重启Ebaas服务器。" %}

#### 测试生成报告

* 使用浏览器登录为用户demo1 (登录名：demo1， 密码：888）；
* 在首页点击“事务管理”图标 => 进入“事务”表格；
* 单击一条数据实例 => 在展开的下拉工具栏，可见“生成报告”图标，如下图所示：

<img src="{{'/assets/img/2018-3-9-显示生成报告定制命令.png' | prepend: site.baseurl }}" alt="">

* 点击“生成报告”图标，弹出确认窗口，如下图所示：

<img src="{{'/assets/img/2018-3-9-点击生成报告定制命令.png' | prepend: site.baseurl }}" alt="">

再点击“生成并下载报告”按键，经过稍许等待服务器生成报告后，会下载为Excel文件。

<img src="{{'/assets/img/2018-3-9-generated-report.png' | prepend: site.baseurl }}" alt="">

至此，配置生成报告的教程介绍完毕。

---
layout: post
title:  "配置Web界面导入和导出数据"
date:   2018-03-06
visible: 1
---

前面教程介绍了使用DesignStudio的数据导入向导批量导出数据工具。但是DesignStudio工具需要单独安装，不便于用户导入数据。

为此，Ebaas提供了基于Web界面的导入功能。前提条件是事先使用DesignStudio配置好数据导入脚本，并使用SiteMapStudio工具配置Web页面的导入功能。

#### 打开SiteMapStudio工具

从开始菜单 => Ebaas => SiteMapStudio打开SiteMapStudio工具，单击工具栏上的“打开”图标，以管理员用户身份以“admin”作为用户名和“admin”作为密码登录。如下图所示:
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据1.png' | prepend: site.baseurl }}" alt=""><br>


#### 修改菜单项的设置

点击“主菜单”节点下的“事务跟踪”菜单项，修改“导航URL”的设置，如下图所示。新的URL是：

{% highlight ruby %}
app.smarttables.datagrid({import:true,export:true})
{% endhighlight %}

如下图所示:
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据2A.png' | prepend: site.baseurl }}" alt=""><br>

#### 保存站点地图模型

点击工具栏上的保存图标保存站点地图模型，如下图所示。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据3.png' | prepend: site.baseurl }}" alt=""><br>

{% include important.html content="需要重新启动Ebaas服务器才能使更改生效。" %}


#### 测试导入及导出操作

使用推荐的Web浏览器连接到http//localhost8080的应用程序。以用户“demo1”和密码“888”登录到Web首页。

点击“事务跟踪”菜单进入表格页面，您会看到表格的标题栏右侧出现的“导出”和“导入”按钮，如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据4.png' | prepend: site.baseurl }}" alt=""><br>
点击“导入”按钮打开一个“导入数据”对话框，单击“选择文件”按钮，如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据5.png' | prepend: site.baseurl }}" alt=""><br>
在打开的文件选择框中，您可以在其中选择一个导入文件，如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据6.png' | prepend: site.baseurl }}" alt=""><br>
单击“选择脚本”右边的向下箭头，选择前面教程创建的”导入事务数据脚本“，如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据7.png' | prepend: site.baseurl }}" alt=""><br>
单击”提交“执行数据导入任务。如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据8.png' | prepend: site.baseurl }}" alt=""><br>
数据导入成功后，会出现”数据导入成功“的信息，如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据9.png' | prepend: site.baseurl }}" alt=""><br>

将“事务”数据导出为Excel文件。
点击“事务”表格的标题栏右侧出现的“导出”按钮，如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据10.png' | prepend: site.baseurl }}" alt=""><br>
数据文件下载完毕后，点击屏幕左下角导出数据文件下拉箭头，选择“打开”，可以浏览导出的数据。如下图。
<img src="{{'/assets/img/2018-3-6-配置Web界面导入导出数据11.png' | prepend: site.baseurl }}" alt=""><br>




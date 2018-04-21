---
layout: post
title:  "配置表单附件功能"
date:   2018-03-03
visible: 1
---

前面教程介绍的表单功能基本上针对用户使用表单输入或参看数据实例的属性值，即结构化数据。如果用户需要在表单中包含一些文档或图片等非结构化数据，则需要在表单中提供文件上传和下载功能。例如，用户在提交一个新的事务时，可能需要在事务表单中上传一些与事务相关的文档或图片。事务处理人也需要在表单中打开或下载相关的图片或文档。

Ebaas平台提供了“附件”管理功能。针对每个数据实例都可以有零到多个附件。附件可以是任何形式的文件。为了方便用户在浏览器上上传或下载数据实例的附件，Ebaas平台提供了一个附件管理的Web组件。在设计表单时，可以将该组件插入到表单的某个位置来实现在表单中进行附件上传或下载的功能。下面我们就介绍如何在Ebaas表单设计器中插入附件管理组件的步骤。

#### 在表单中插入附件管理组件

浏览器地址栏输入：http://locslhost:8080 ， 用户名输入：demo1，密码：888，进入首页单击“表单设计”图标，见下图：

<img src="{{'/assets/img/2018-03-03 配置表单附件功能1.png' | prepend: site.baseurl }}" alt="">

在打开的表单设计器页面中，单击“打开表单”图标，在“新建或打开表单”面板左边选中“事务”数据类，右边“已存在的表单”选择“defaualt”，单击“确定”按钮，见下图：

<img src="{{'/assets/2018-03-03 配置表单附件功能2.png' | prepend: site.baseurl }}" alt="">

在打开的“default”表单，工具栏单击“源码”图标，在底部插入以下代码（可以选择表单的任何位置）：

{% highlight ruby %}
<div class="row">
<div class="col col-md-12">
<div class="content"><attachments dbclass="dbclass" dbschema="dbschema" oid="oid"></attachments></div>
</div>
</div>
{% endhighlight %}

见下图：
<img src="{{'/assets/img/2018-03-03 配置表单附件功能4.png' | prepend: site.baseurl }}" alt="">

完后再次单击“源码”图标，回到表单页面，单击“保存”图标保存修改，单击“预览”图标可以查看效果。

#### 测试表单上传附件

回到事务数据记录页面，单击右上角“+添加”图标，输入相关数据，接下来在表单中单击“显示上传功能”，展开上传区域，见下图：

<img src="{{'/assets/2018-03-03 配置表单附件功能7.png' | prepend: site.baseurl }}" alt="">

单击“选择文件”在打开“打开”文件框中，选择要上传的图或文件，见下图：

<img src="{{'/assets/img/2018-03-03 配置表单附件功能8.png' | prepend: site.baseurl }}" alt="">

完成单击“打开”，单击“上传”按钮，图片或文件将上传，见下图：

<img src="{{'/assets/img/2018-03-03 配置表单附件功能9.png' | prepend: site.baseurl }}" alt="">

文件或图片上传完毕后，单击“提交”按钮，完成后，单击“关闭”按钮，见下图：
<img src="{{'/assets/img/2018-03-03 配置表单附件功能10.png' | prepend: site.baseurl }}" alt="">


#### 测试表单下载附件

单击记录下展开工具栏“附件”图标，单击右上角“下载”图标，就可以下载文件，见下图：

<img src="{{'/assets/img/2018-03-03 配置表单附件功能11.png' | prepend: site.baseurl }}" alt="">


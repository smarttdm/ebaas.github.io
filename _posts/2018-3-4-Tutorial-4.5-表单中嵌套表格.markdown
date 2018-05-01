---
layout: post
title:  "表单中嵌套表格"
date:   2018-03-04
visible: 1
---

前面的教程主要针对单一数据类设计自定义表单，也就是说表单中的字段都来自一个数据类（事务）。Ebaas表单设计器允许在表单中插入关联数据类的属性，即所谓的跨数据类表单。用户在使用跨数据类表单填写数据时，无需考虑表单的字段属于那个数据类。一旦提交表单后，Ebaas服务器会自动识别属于不同数据类的属性，分别添加或修改不同数据类的数据实例，并建立关联关系等，无需编写任何代码。

{% include note.html content="在创建表单时需要选择一个‘主’数据类，只有与主数据类直接关联的数据类的属性可以插入到表单中。关联的数据类可以是通过多对一，一对多，或多对多关系所关联的数据类。" %}

比较常见的需求是在表单中嵌套二维表格来展示或编辑通过一对多关系所关联的数据类的数据实例。例如，在“事务”表单中以表格的方式查看或添加多条“意见”数据记录，而无需在页面转换到“意见”数据类进行操作。这个教程，我们将介绍如何在“事务”表单中插入显示“意见”的二维表格。

#### 配置关系属性的显示控件
首先，使用DesignStudio打开“意见”数据类。“意见”数据类到“事务”数据类应建立了一个多对一的关系属性，叫做“到事务”。对这个关系属性的“控件生成器”配置动态表格控件，如下图所示：

{% highlight ruby %}
Newtera.WebForm.RelationshipGridViewControl,Newtera.WebForm
{% endhighlight %}

<img src="{{'/assets/img/018-3-4-表单中嵌套表格1.png' | prepend: site.baseurl }}" alt="">
#### 创建意见数据视图
鼠标右键“数据视图”，单击“创建”，如下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格2.png' | prepend: site.baseurl }}" alt=""><br>
在弹出“添加新体”对话框中，输入名称：commenView，显示名：事务视图，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格3.png' | prepend: site.baseurl }}" alt=""><br>
在弹出的“数据视图”框中，单击“数据类”右边“...”按钮，添加数据类，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格4.png' | prepend: site.baseurl }}" alt=""><br>
在弹出的“选择数据类”框中，选择“意见”数据类，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格5.png' | prepend: site.baseurl }}" alt=""><br>
在下一步，单击“关联数据类”，在弹出的“选择关联数据类”框，右边选择“事务”数据类，单击中间的向左箭头，将“意见”数据类添加到左边，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格6.png' | prepend: site.baseurl }}" alt=""><br>
单击“确定“按钮，单击”下一步“，在”返回属性“卡，单击”添加“，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格8.png' | prepend: site.baseurl }}" alt=""><br>
在弹出”选择返回结果属性“框，选择左边要返回的属性，再单击中间向右箭头，将属性添加到右边”返回属性结果“框中，结果见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格9.png' | prepend: site.baseurl }}" alt=""><br>
单击”确认“按钮，结果见下图:
<img src="{{'/assets/img/018-3-4-表单中嵌套表格10.png' | prepend: site.baseurl }}" alt=""><br>
 单击”结束“按钮。
 单击”意见“数据类，在”参数设置“面板，”嵌套表数据视图“栏单击向下箭头，选择”事务视图“，见下图：
 <img src="{{'/assets/img/018-3-4-表单中嵌套表格11.png' | prepend: site.baseurl }}" alt=""><br>
 完成后，单击工具栏”保存数据库“图标，见下图：
 <img src="{{'/assets/img/018-3-4-表单中嵌套表格12.png' | prepend: site.baseurl }}" alt=""><br>

完成后，单击工具栏“保存数据库模型到数据库中”图标，保存到数据库。

#### 在表单中插入关系属性
登入浏览器http://localhost:8080  在首页单击“表单设计器”图标，在“表单设计器”工具栏单击“打开”图标，在打开的“新建或打开表单”左边选择“事务”数据类，右边选择“default”表单，单击“确定”按钮，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格13.png' | prepend: site.baseurl }}" alt="">
在打开的“事务”表单中，单击工具栏“源码”图标，插入下面代码：

{% highlight ruby %}
<div class="row row-7">
<div class="col col-md-12">
<div class="content">
</div>
</div>
</div>
{% endhighlight %}

如下图所示：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格14.png' | prepend: site.baseurl }}" alt="">
完成后单击“源码”回到表单设计页面，光标放在刚刚插入的空白行，单击工具栏”插入表单字段“，在打开的”插入表单字段“中，选择左边”意见“数据类，再选择右边数据类属性”到事务（R）“，单击”确定“按钮，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格15.png' | prepend: site.baseurl }}" alt=""><br>
结果见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格16.png' | prepend: site.baseurl }}" alt=""><br>
完成后，单击工具栏”保存“图标。

#### 测试嵌套二维表格
在事务记录页面，单击右上角”+添加“，在打开新表单中，输入相关数据，单击”提交“按钮，数据提交成功后，单击”关闭“按钮，见下图：
<img src="{{'/assets/img/018-3-4-表单中嵌套表格13.png' | prepend: site.baseurl }}" alt="">
单击刚提交的这条记录，在下弹出的工具栏单击”编辑“按钮，在打开的编辑表单中可以看到嵌入的”意见“二维表单，见下图；
<img src="{{'/assets/img/018-3-4-表单中嵌套表格7.png' | prepend: site.baseurl }}" alt="">





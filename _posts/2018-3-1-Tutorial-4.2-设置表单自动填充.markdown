---
layout: post
title:  "设置表单字段自动填充"
date:   2020-05-11
visible: 1
---

在许多应用场景，表单中的某些字段具有一定关联逻辑，这意味着某个字段值的更改可能会导致其他字段值的更改。例如，在“事务”表单中，当事务的“状态”变为“关闭”时，可以自动将表单中“进度”字段的值自动填充为100，或将“关闭日期”字段的值填充为当前日期，而不需要用户手工填充。

您可以使用DesignStudio在数据模型中配置来实现自动填充的逻辑。

#### 实现回调函数

编写填充逻辑的位置是“事务”数据类的“回调函数程序”。
在DseignStudio，在“数据模型编辑器”中，选中“事务”数据类，在“参数设置”面板，单击“回调函数程序”栏右边“...”按钮，如下图：
<img src="{{'/assets/img/2018-2-29-设置表单字段自动填充1.png' | prepend: site.baseurl }}" alt=""><br>
打开代码编辑器，将以下代码复制粘贴到编辑器。

{% highlight ruby %}
if (this.Property == "Status")
{
  string status = this.Instance.GetString("Status");
  if (status == "关闭")
  {
      this.Instance.SetValue("进度", "100");
      this.Instance.SetValue("关闭日期", CurrentDate);
  }
}
{% endhighlight %}

如下图：
<img src="{{'/assets/img/2018-2-29-设置表单字段自动填充2.png' | prepend: site.baseurl }}" alt=""><br>

由于“回调函数程序”可以被表单中多个字段值的变化激活。所以，需要用<code>if (this.Property ==“Status”)</code> 语句来判断是否是“Status”这个字段值变化所激活的回调函数，以便区分其它字段值变化所激活的回调函数。

{% include note.html content="使用回调函数设置属性的值，属性必须显示在表单中。没有在表单中的属性的值需要修改的话，可以在DesignStudio中对该数据类的“修改前程序”进行设置。代码的编写方式类似“初始化程序”的代码。这里就不详细介绍了。" %}


#### 在“状态”属性上启用回调

接下来，您需要通过将“使用调用回调”设置为“True”来启用“状态”属性上的回调。
在左边栏选择“事务”数据类的“状态”属性，在“参数设置”卡中，使用“回调函数”设置为“true”，如下图：
<img src="{{'/assets/img/2018-2-29-设置表单字段自动填充3.png' | prepend: site.baseurl }}" alt=""><br>

#### 测试表单自动填充
使用浏览器登录到Web界面，单击首页的“事务管理”图标，进入“事务”数据表格页面，单击某条数据实例，在下拉的工具栏中，单击“编辑”图标，
现在，打开“事务”表单进行编辑，将“状态”的值更改为“关闭”，观察“进度”字段的值应变为100和“关闭日期”字段的值因为当前日期。如下图：
<img src="{{'/assets/img/2018-2-29-设置表单字段自动填充4A.png' | prepend: site.baseurl }}" alt=""><br>


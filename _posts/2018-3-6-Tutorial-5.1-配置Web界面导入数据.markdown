---
layout: post
title:  "配置Web界面导入数据"
date:   2018-03-06
visible: 1
---

由于您已将导入配置另存为包，因此您可以使用Web浏览器执行导入任务，而不是使用DesignStudio工具，这样更方便。

要为Web客户端启用导入和导出数据，请使用SiteMapStudio工具对其进行配置。

第1步：打开SiteMapStudio工具

在开始 - > Ebaas-> SiteMapStudio中打开SiteMapStudio工具，单击工具栏上的“打开”图标，以管理员用户身份以“admin”作为用户名和“admin”作为密码登录。

第2步：更改菜单项目的设置

点击“主菜单”节点下的“问题跟踪”菜单项，修改“导航URL”的设置，如图9所示。新的URL是：

app.smarttables.datagrid（{import：true，export：true}）


第3步：保存站点地图模型

点击工具栏上的保存图标保存站点地图模型。

请注意，您必须重新启动Ebaas服务器才能使更改生效。

第4步：尝试一下

使用推荐的Web浏览器连接到http：// localhost：8080的应用程序。

用“demo1”作为用户名，用“888”作为密码登录。

打开“问题跟踪”页面，您会看到标题栏右侧出现的“导出”和“导入”按钮（见图10）。


点击“导入”按钮打开一个对话框（参见图11），您可以在其中选择一个导入文件和使用DesignStudio创建的导入包，并使用Web浏览器执行数据导入任务。

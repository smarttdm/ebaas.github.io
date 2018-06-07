---
layout: post
title:  "生成PDF报告"
date:   2018-03-09
visible: 1
---

#### 概述

前面教程介绍了生成Excel报告的配置方法。在许多应用场景需要生成PDF的报告，例如事务处理报告和试验报告等业务报告。报告的内容和格式根据需求而变化并且非常动态。采用代码开发的方式实现这类报告将非常费时费力，而且不容易修改。不能满足许多生成报告场景的要求。因而，需要提供一种灵活和省时的方法来应对生成PDF报告的需求。

Ebaas平台（7.4.0以上版本）提供了一种基于XSL-FO模板及XML数据生成PDF报告的机制。其中XSL-FO模板负责定义报告的显示格式，XML提供报告中的数据。报告生成引擎使用XSL-FO模板和XML数据作为输入，动态地生成PDF报告。

这个机制的好处是无需编写任何代码，通过配置就能灵活应对各种复杂的报告生成需求。

XSL-FO格式化规范是W3C的建议的标准。XSL-FO定义了许多XML标记，这些标记描述了应如何显示内容。结合XSL脚本，XL-FO可以定义各种复杂的报告显示要求，是非常强大而且易学的一种语言。如果您想深入研究XSL-FO，可以到W3C的网站直接查阅该规范的文档。本教程将不做深入的介绍。

下面，我们通过一个生成报告的例子介绍配置生成事务报告（PDF）的步骤。

#### 导出XML数据

首先，我们需要导出一个创建报告模板所需的XML数据。因为在创建XSL-FO模板时需要在不同的位置应用XML数据的元素，这样在最终生成PDF报告时，生成报告的引擎能从动态生成的XML数据中选择相应元素的数据并将数据插入到报告的具体位置。

导出事务的XML数据结构是依据所使用的XML架构。我们在前面教程介绍了如何在“事务”数据类上创建XML架构。如果您没有创建事务的XML架构，请参看 <a class="post-link" href="https://smarttdm.github.io/blog/Tutorial-6.0-%E9%85%8D%E7%BD%AEExcel%E6%8A%A5%E8%A1%A8%E6%95%B0%E6%8D%AE%E6%BA%90XML%E6%9E%B6%E6%9E%84/">这个教程</a>创建。如果已经创建了XML架构，请按照下面步骤执行。

* 打开DesignStudio，以admin用户登录到“事务跟踪管理”数据库；
* 进入DS的“数据编辑器”，左边菜单选择“事务”数据类后，右边表格显示事务数据实例；
* 鼠标右键点击一条事务数据实例，从弹出的菜单中选择“导出XML...”，见下图；

<img src="{{'/assets/img/2018-3-9-2-导出XML数据.png' | prepend: site.baseurl }}" alt="">

* 从弹出的“XML架构”窗口中选择“事务XML架构”，点击“确认”；

<img src="{{'/assets/img/2018-3-9-2-选择XML架构.png' | prepend: site.baseurl }}" alt="">

* 将生成的XML数据保存为一个xml文件在本地；
* 使用文本编辑器打开保存的xml文件，显示的内容如下图；

<img src="{{'/assets/img/2018-3-9-2-事务XML数据.png' | prepend: site.baseurl }}" alt="">

#### 创建报告模板

假设我们要生成的PDF报告为以下显示的样例，包含页头，页尾，事务信息及该事物意见的列表。

<img src="{{'/assets/img/2018-3-9-2-PDF报告格式.png' | prepend: site.baseurl }}" alt="">

针对这个要求，我们可以使用XSL-FO语言创建一个报告模板，其代码如下。

{% highlight ruby %}
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Format"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:template match="事务">
    <root font-family="宋体">
      <layout-master-set>
        <simple-page-master master-name="page-layout" page-height="11in" page-width="8.5in" margin-top=".5in" margin-bottom=".5in" margin-left=".5in" margin-right=".5in">
          <region-body margin="1in" region-name="body" />
		  <region-before region-name="xsl-region-before" extent="5in" padding-left=".5in" padding-right=".5in"/>
          <region-after region-name="xsl-region-after" extent=".5in" padding-left=".5in" padding-right=".5in"/>
        </simple-page-master>
      </layout-master-set>
      <page-sequence master-reference="page-layout">
	    <static-content flow-name="xsl-region-before">
			<block space-after="0pt" space-after.conditionality="retain" line-height="1.147" font-size="11pt" text-align="left">
				<inline>
					<external-graphic src="url(MyLogo.png)" content-height="scale-to-fit" scaling="non-uniform"/>
				</inline>
				<block-container>
				   <block text-align="center" font-size="20pt" font-weight="bold">事务处理报告</block>
				</block-container >
			</block>
        </static-content>
        <static-content flow-name="xsl-region-after">
			<block text-align-last="justify">
			  公司名称
			  <leader leader-pattern="space" text-align="end"/>
				Page <page-number/> of 
						<page-number-citation ref-id="TheVeryLastPage"/>
			</block>
        </static-content>
        <flow flow-name="body">
			<block>&#160;</block>
		  <block font-size="13pt" font-weight="bold">事务信息</block>
		  <table>
            <table-column column-number="1" column-width="40%" />
            <table-column column-number="2" column-width="60%" />
            <table-body>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  主题
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="主题/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  描述
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="描述/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  提交日期
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="提交日期/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  关闭日期
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="关闭日期/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  状态
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="状态/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  提交人
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="提交人/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  处理人
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="处理人/text()" />
					</block>
				  </table-cell>
				</table-row>
				<table-row>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  进度
					</block>
				  </table-cell>
				  <table-cell border="1pt solid black" padding="4pt">
					<block>
					  <xsl:value-of select="进度/text()" />
					</block>
				  </table-cell>
				</table-row>
            </table-body>
          </table>
		  <block>&#160;</block>
		  <block font-size="13pt" font-weight="bold">事务处理意见表</block>
          <table>
            <table-column column-number="1" column-width="30%" />
            <table-column column-number="2" column-width="15%" />
            <table-column column-number="3" column-width="55%" />
            <table-header font-weight="bold">
              <table-row>
                <table-cell border="1pt solid black" padding="4pt">
                  <block>提交时间</block>
                </table-cell>
                <table-cell border="1pt solid black" padding="4pt">
                  <block>提交人</block>
                </table-cell>
                <table-cell border="1pt solid black" padding="4pt">
                  <block>内容</block>
                </table-cell>
              </table-row>
            </table-header>
            <table-body>
              <xsl:apply-templates select="意见" />
            </table-body>
          </table>
		  <block id="TheVeryLastPage" />
        </flow>
      </page-sequence>
    </root>
  </xsl:template>
  <xsl:template match="意见">
    <table-row>
      <table-cell border="1pt solid black" padding="4pt">
        <block>
          <xsl:value-of select="提交时间/text()" />
        </block>
      </table-cell>
      <table-cell border="1pt solid black" padding="4pt">
        <block>
          <xsl:value-of select="提交人/text()" />
        </block>
      </table-cell>
      <table-cell border="1pt solid black" padding="4pt">
        <block>
          <xsl:value-of select="内容/text()" />
        </block>
      </table-cell>
    </table-row>
  </xsl:template>
</xsl:stylesheet>
{% endhighlight %}

您可以将上面的XSL-FO代码复制粘贴到记事本中，保存为issueReport.xsl。注意要保存为UTF-8编码格式。

#### 部署报告模板

将创建的XSL-FO模板文件手工复制到下面所示的目录下。如果第一次部署模板，部分目录路径不存在，需要手工创建后再将模板文件复制粘贴进去。

{% highlight ruby %}
C:\Program Files\Ebaas\Templates\Reports\事务跟踪管理 1.0\Issue
{% endhighlight %}

#### 创建“生成PDF报告”定制命令

使用SiteMapStudio为“事务”数据类创建一个“生成PDF报告”的定制命令，步骤如下：

* 从“开始”菜单 => Ebaas => SiteMapStudio打开SiteMapStudio工具 => “文件” => “打开” => 登录为admin；
* 右键点击“事务跟踪管理”下的“事务命令组”节点 => 在弹出的“菜单”中选择“添加” => 在弹出的“添加新项”名称栏输入：PDFReport => 确定”;
* 选择新创建的“PDFReport”定制命令，在“设置”选项卡中按照下表的参数进行设置：

| 设置参数名 | 设置参数值 | 描述 |
|-------|--------|---------|
| 名称 | PDFReport | 定制命令的名称，必须是唯一的 |
| 显示名 | 生成PDF报告 | 定制命令在用户界面显示的名称 |
| 模块URL | .report | 定制命令使用的界面模块，该模块是生成报告的模块 |
| 图标名称 | fa fa-lg fa-file-pdf-o | 定制命令显示的PDF图标 |

点击“模块参数”右边“...”按钮 => 在弹出的“定义参数”框 => 点击“添加”按钮 => 按照下表设置参数：

| 设置参数名 | 设置参数值 | 描述 |
|-------|--------|---------|
| template | issueReport.xsl | 指定生成报告的XSL-FO模板 |

配置结果如下图所示：

<img src="{{'/assets/img/2018-3-9-2-创建生成PDF报告定制命令.png' | prepend: site.baseurl }}" alt="">

点击“文件” => 选择“保存”。

{% include important.html content="保存后请重启Ebaas服务器。" %}

#### 测试生成PDF报告

* 使用浏览器连接到http://localhost:8080；
* 登录为用户demo1 (登录名：demo1， 密码：888）；
* 在首页点击“事务管理”图标 => 进入“事务”表格；
* 单击一条数据实例 => 在展开的下拉工具栏，可见“生成PDF报告”图标，如下图所示：

<img src="{{'/assets/img/2018-3-9-2-显示生成报告定制命令.png' | prepend: site.baseurl }}" alt="">

* 点击“生成报告”图标，弹出确认窗口，再点击“生成并下载报告”按键，经过稍许等待服务器生成报告后，会下载为PDF报告文件。

<img src="{{'/assets/img/2018-3-9-2-generated-report.png' | prepend: site.baseurl }}" alt="">

基于XSL-FO和XML的生成报告机制可以生成任意复杂的报告格式。您可以深入了解XSL-FO的标识的用法，定义更复杂的报告模板。可查看参考资料：<a class='post-link' href='http://www.xmlpdf.com/builds/ibex.pdf'>Ibex PDF使用文档</a> 

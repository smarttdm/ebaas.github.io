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
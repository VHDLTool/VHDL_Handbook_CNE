<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
   xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
   xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
   xmlns:hb="HANDBOOK"
   exclude-result-prefixes="office table text hb">

<!-- Headers -->
<xsl:template name="headerColumns">
	<!-- Format the columns of the table -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- UID -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- RuleUID -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Status -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Version -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Creation -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Modified -->
	<table:table-column table:style-name="co1" table:default-cell-style-name="Default"/> <!-- Revision -->
	<table:table-column table:style-name="co3" table:default-cell-style-name="Default"/> <!-- Name -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- IsParent -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- IsSon -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- ParentUID -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- Technology -->
	<table:table-column table:style-name="co5" table:default-cell-style-name="Default"/> <!-- Application fields -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Category -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- SubCategory -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Severity -->
	<table:table-column table:style-name="co1" table:default-cell-style-name="Default"/> <!-- Rationale -->
	<table:table-column table:style-name="co3" table:default-cell-style-name="Default"/> <!-- ShortDesc -->
	<table:table-column table:style-name="co1" table:default-cell-style-name="Default"/> <!-- LongDesc -->
	<table:table-column table:style-name="co5" table:default-cell-style-name="Default"/> <!-- RemediationEffort -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- SonarSeverity -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Tag -->
	<table:table-column table:style-name="co3" table:default-cell-style-name="Default"/> <!-- GoodExDesc -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- GoodExample -->
	<table:table-column table:style-name="co3" table:default-cell-style-name="Default"/> <!-- BadExDesc -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- BadExample -->
	<table:table-column table:style-name="co3" table:default-cell-style-name="Default"/> <!-- FigureDesc -->
	<table:table-column table:style-name="co5" table:default-cell-style-name="Default"/> <!-- Figure name-->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- Figure height-->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- Figure width-->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- ParamId -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- Relation -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- MinValue -->
	<table:table-column table:style-name="co2" table:default-cell-style-name="Default"/> <!-- MaxValue -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- SetVersion -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- Set creation -->
	<table:table-column table:style-name="co4" table:default-cell-style-name="Default"/> <!-- Set Modified -->
	<table:table-column table:style-name="co1" table:default-cell-style-name="Default"/> <!-- Set Revision -->

	<!-- <table:table-row table:default-cell-style-name="ro0"> -->
	<table:table-header-rows>
		<table:table-row table:style-name="ro0" table:default-cell-style-name="handbookHeader">
			<table:table-cell office:value-type="string"><text:p>UID</text:p></table:table-cell>
			<table:table-cell office:value-type="string"><text:p>RuleUID</text:p></table:table-cell>
			<!-- History -->
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Status</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Version</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Creation</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Modified</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Revision</text:p></table:table-cell>
			<!-- Rule Content -->
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Name</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>IsParent</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>IsSOn</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>ParentUID</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Technology</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>ApplicationFields</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Category</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>SubCategroy</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Severity</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Rationale</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>ShortDesc</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>LongDesc</text:p></table:table-cell>
			<!-- RuleDebt -->
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>RemediationEffort</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>SonarSeverity</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Tag</text:p></table:table-cell>
			<!-- Rule Desc -->
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>GoodExDesc</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>GoodExample</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>BadExDesc</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>BadExample</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>FigureDesc</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Figure file name</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Figure height</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Figure width</text:p></table:table-cell>
			<!-- Parameters -->
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>ParamId</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Relation</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Value min</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Value max</text:p></table:table-cell>
			
			<!-- Ruleset history -->
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Set Version</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Set Creation</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Set Modified</text:p></table:table-cell>
			<table:table-cell table:style-name="handbookHeader" office:value-type="string"><text:p>Set Revision</text:p></table:table-cell>

		</table:table-row>
	</table:table-header-rows>
	
	<!-- First content line: Ruleset -->
	<table:table-row table:style-name="ro1" table:default-cell-style-name="handbookEvenRow">
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<!-- History -->
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<!-- Rule Content -->
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<!-- RuleDebt -->
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<!-- Rule Desc -->
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<!-- Parameters -->
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		<table:table-cell office:value-type="string"><text:p></text:p></table:table-cell>
		
		<!-- Ruleset history -->
		<xsl:call-template name="lastColumns" />
	</table:table-row>
</xsl:template>


<!-- End of the table -->
<xsl:template name="lastColumns">
	<!-- Rule set History -->
	<table:table-cell><text:p><xsl:value-of select="/hb:RuleSet/hb:RuleSetHist/hb:Version"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="/hb:RuleSet/hb:RuleSetHist/hb:Creation"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="/hb:RuleSet/hb:RuleSetHist/hb:Modified"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="/hb:RuleSet/hb:RuleSetHist/hb:Revision"/></text:p></table:table-cell>
</xsl:template>


<!-- Table begin -->
 <xsl:template name="firstColumns">
	<!-- The rootNode contains the rule node (far the case of this template is called drom Parameters/ParamInt (String / Range) -->
	<xsl:param name="rootNode" />

	<table:table-cell><text:p><xsl:value-of select="$rootNode/@UID"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleUID"/></text:p></table:table-cell>
	
	<!-- RuleHist -->
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleHist/hb:Status"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleHist/hb:Version"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleHist/hb:Creation"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleHist/hb:Modified"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleHist/hb:Revision"/></text:p></table:table-cell>

	<!-- Rule Content -->
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:Name"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:IsParent"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:IsSon"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:ParentUID"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:Technology"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:ApplicationFields"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:Category"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:SubCategory"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:Severity"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:Rationale"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:ShortDesc"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleContent/hb:LongDesc"/></text:p></table:table-cell>

	<!-- Rule Debt -->
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDebt/hb:RemediationEffort"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDebt/hb:SonarSeverity"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDebt/hb:Tag"/></text:p></table:table-cell>

	<!-- Rule Desc -->
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDesc/hb:GoodExDesc"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDesc/hb:GoodExample"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDesc/hb:BadExDesc"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDesc/hb:BadExample"/></text:p></table:table-cell>
	<table:table-cell><text:p><xsl:value-of select="$rootNode/hb:RuleDesc/hb:FigureDesc"/></text:p></table:table-cell>
 	<xsl:call-template name="setFigure" >
		<xsl:with-param name="rootNode" select=" $rootNode/hb:RuleDesc/hb:Figure"/>	
	</xsl:call-template>
	
 </xsl:template>

<xsl:template name="setFigure">
	<xsl:param name="rootNode" />
	
	<xsl:if test="count($rootNode/@*) = 3">
		<table:table-cell><text:p><xsl:value-of select="$rootNode/@fileref"/></text:p></table:table-cell>
		<table:table-cell><text:p><xsl:value-of select="$rootNode/@height"/></text:p></table:table-cell>
		<table:table-cell><text:p><xsl:value-of select="$rootNode/@width"/></text:p></table:table-cell>
	</xsl:if>
	<xsl:if test="not(count($rootNode/@*) = 3)">
		<table:table-cell><text:p></text:p></table:table-cell>
		<table:table-cell><text:p></text:p></table:table-cell>
		<table:table-cell><text:p></text:p></table:table-cell>
	</xsl:if>
	
</xsl:template>



<xsl:template match="/">
  <office:document-content 
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" 
  xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" 
  xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" 
  xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
  xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" 
  xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0" 
  xmlns:xlink="http://www.w3.org/1999/xlink" 
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0" 
  xmlns:number="urn:oasis:names:tc:opendocument:xmlns:datastyle:1.0" 
  xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0" 
  xmlns:chart="urn:oasis:names:tc:opendocument:xmlns:chart:1.0" 
  xmlns:dr3d="urn:oasis:names:tc:opendocument:xmlns:dr3d:1.0" 
  xmlns:math="http://www.w3.org/1998/Math/MathML" 
  xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0" 
  xmlns:script="urn:oasis:names:tc:opendocument:xmlns:script:1.0" 
  xmlns:ooo="http://openoffice.org/2004/office" 
  xmlns:ooow="http://openoffice.org/2004/writer" 
  xmlns:oooc="http://openoffice.org/2004/calc" 
  xmlns:dom="http://www.w3.org/2001/xml-events" 
  xmlns:xforms="http://www.w3.org/2002/xforms" 
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns:hb="HANDBOOK"  
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" office:version="1.0">

		<office:automatic-styles>
			<!-- Column styles (co1: column with 10 cm width, co2: column with 2 cm width, co3: column with 6 cm width) -->
			<style:style style:name="co1" style:family="table-column">
				<style:table-column-properties fo:break-before="auto" style:column-width="10.000cm"/>
			</style:style>
			<style:style style:name="co2" style:family="table-column">
				<style:table-column-properties fo:break-before="auto" style:column-width="2.000cm"/>
			</style:style>
			<style:style style:name="co3" style:family="table-column">
				<style:table-column-properties fo:break-before="auto" style:column-width="6.000cm"/>
			</style:style>
			<style:style style:name="co4" style:family="table-column">
				<style:table-column-properties fo:break-before="auto" style:column-width="3.000cm"/>
			</style:style>
			<style:style style:name="co5" style:family="table-column">
				<style:table-column-properties fo:break-before="auto" style:column-width="3.500cm"/>
			</style:style>
			
			<!-- Row styles -->
			<style:style style:name="ro0" style:family="table-row">
				<style:table-row-properties fo:break-before="auto" style:row-height="0.500cm" fo:background-color="#cccccc"/>
			</style:style>
			<style:style style:name="ro1" style:family="table-row">
				<style:table-row-properties fo:break-before="auto" style:row-height="2.000cm" style:use-optimal-row-height="true"/> <!-- fo:background-color="#eeee11"/-->
			</style:style>
			<style:style style:name="ro2" style:family="table-row">
				<style:table-row-properties fo:break-before="auto" style:row-height="2.000cm" style:use-optimal-row-height="true"/> <!--fo:background-color="#aa1111"/ -->
			</style:style>
			<style:style style:name="ro3" style:family="table-row">
				<style:table-row-properties fo:break-before="auto" style:row-height="2.000cm" style:use-optimal-row-height="true"/> <!-- fo:background-color="#ee11ee"/ -->
			</style:style>
			<style:style style:name="ro4" style:family="table-row">
				<style:table-row-properties fo:break-before="auto" style:row-height="2.000cm" style:use-optimal-row-height="true"/> <!-- style:row-height="2.000cm" fo:background-color="#ee1111"/-->
			</style:style>

		</office:automatic-styles>

		<office:body>
			<office:spreadsheet>
				<table:table>
					<xsl:call-template name="headerColumns" />

					<!-- ================= Body =========================== -->
					<xsl:for-each select="hb:RuleSet/hb:Rule">
						<!-- Parameters -->
						<xsl:if test="hb:RuleParams">
							<xsl:call-template name="writeRule">
								<xsl:with-param name="parentPos" select="position()" />
							</xsl:call-template>
						</xsl:if>
						
						<!-- No parameters -->
						<xsl:if test="not(hb:RuleParams)">
							<xsl:choose>
								<xsl:when test="not((position() mod 2) = 0)">
									<table:table-row table:style-name="ro2" table:default-cell-style-name="handbookEvenRow">
										<xsl:call-template name="writeLine" />
									</table:table-row>
								</xsl:when>
								<xsl:otherwise>									
									<table:table-row table:style-name="ro1" table:default-cell-style-name="handbookOddRow">
										<xsl:call-template name="writeLine" />
									</table:table-row>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>

					</xsl:for-each>
				</table:table>
				
			</office:spreadsheet>
		</office:body>
	</office:document-content>
</xsl:template>



<!-- template for the rules -->
<xsl:template name="writeRule">
    <xsl:param name="parentPos"/>

	<!-- Parameters -->
	<xsl:if test="hb:RuleParams">
		<!-- IntParam -->
		<xsl:for-each select="hb:RuleParams/hb:IntParam">
			<xsl:choose>
				<xsl:when test="(position() mod 2) = 0">
					<table:table-row table:style-name="ro4" table:default-cell-style-name="handbookParamEven">
						<xsl:call-template name="firstColumns"> 
							<xsl:with-param name="rootNode" select=" ../.."/>
						</xsl:call-template>
						<table:table-cell><text:p><xsl:value-of select="hb:ParamID" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Relation" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Value" /></text:p></table:table-cell>
						<table:table-cell><text:p></text:p></table:table-cell>
					</table:table-row>
				</xsl:when>
				<xsl:otherwise>									
					<table:table-row table:style-name="ro3" table:default-cell-style-name="handbookParamOdd">
						<xsl:call-template name="firstColumns"> 
							<xsl:with-param name="rootNode" select=" ../.."/>
						</xsl:call-template>
						<table:table-cell><text:p><xsl:value-of select="hb:ParamID" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Relation" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Value" /></text:p></table:table-cell>
						<table:table-cell><text:p></text:p></table:table-cell>
					</table:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		
		<xsl:variable name="nbParamInt" select="count(hb:RuleParams/hb:IntParam)" />
		
		<!-- StringParam -->
		<xsl:for-each select="hb:RuleParams/hb:StringParam">
			<xsl:choose>
				<xsl:when test="(($nbParamInt + position()) mod 2) = 0">
					<table:table-row table:style-name="ro4" table:default-cell-style-name="handbookParamEven">
						<xsl:call-template name="firstColumns"> 
							<xsl:with-param name="rootNode" select=" ../.."/>
						</xsl:call-template>
						<table:table-cell><text:p><xsl:value-of select="hb:ParamID" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Position" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Value" /></text:p></table:table-cell>
						<table:table-cell><text:p></text:p></table:table-cell>
					</table:table-row>
				</xsl:when>
				<xsl:otherwise>									
					<table:table-row table:style-name="ro3" table:default-cell-style-name="handbookParamOdd">
						<xsl:call-template name="firstColumns"> 
							<xsl:with-param name="rootNode" select=" ../.."/>
						</xsl:call-template>
						<table:table-cell><text:p><xsl:value-of select="hb:ParamID" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Position" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Value" /></text:p></table:table-cell>
						<table:table-cell><text:p></text:p></table:table-cell>
					</table:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>

		<xsl:variable name="nbParamIntAndString" select="$nbParamInt + count(hb:RuleParams/hb:StringParam)" />
		
		<!-- RangeParam -->
		<xsl:for-each select="hb:RuleParams/hb:RangeParam">
			<xsl:choose>
				<xsl:when test="(($nbParamIntAndString + position()) mod 2) = 0">
					<table:table-row table:style-name="ro4" table:default-cell-style-name="handbookParamEven">
						<xsl:call-template name="firstColumns"> 
							<xsl:with-param name="rootNode" select=" ../.."/>
						</xsl:call-template>
						<table:table-cell><text:p><xsl:value-of select="hb:ParamID" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Range" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:ValueMin" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:ValueMax" /></text:p></table:table-cell>
					</table:table-row>
				</xsl:when>
				<xsl:otherwise>									
					<table:table-row table:style-name="ro3" table:default-cell-style-name="handbookParamOdd">
						<xsl:call-template name="firstColumns"> 
							<xsl:with-param name="rootNode" select=" ../.."/>
						</xsl:call-template>
						<table:table-cell><text:p><xsl:value-of select="hb:ParamID" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:Range" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:ValueMin" /></text:p></table:table-cell>
						<table:table-cell><text:p><xsl:value-of select="hb:ValueMax" /></text:p></table:table-cell>
					</table:table-row>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:if>
</xsl:template>


<!-- Wite a line on calc -->
<xsl:template name="writeLine">
	<xsl:call-template name="firstColumns"> 
		<xsl:with-param name="rootNode" select=" ."/>
	</xsl:call-template>
	<!-- Empty parameters -->
	<table:table-cell><text:p></text:p></table:table-cell>
	<table:table-cell><text:p></text:p></table:table-cell>
	<table:table-cell><text:p></text:p></table:table-cell>
	<table:table-cell><text:p></text:p></table:table-cell>
</xsl:template>

</xsl:stylesheet>
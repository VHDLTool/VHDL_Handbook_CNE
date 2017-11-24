<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
   xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
   xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
   xmlns:hb="HANDBOOK"
   exclude-result-prefixes="office table text hb">

<xsl:output method = "xml" indent = "yes" encoding = "UTF-8" omit-xml-declaration = "no"/>


<!-- This template manage cell content to translate into correct content including new lines -->
<xsl:template match="text:line-break">
      <xsl:text>&#x0A;</xsl:text>
</xsl:template>

<!-- This template manage cell content to translate into correct content including tabs -->
<xsl:template match="text:tab">
      <xsl:text>&#09;</xsl:text>
</xsl:template>

<!-- Space preservation -->
<xsl:variable name="spaces"
    xml:space="preserve">                              </xsl:variable>

<xsl:template match="text:s">
	<xsl:choose>
		<xsl:when test="@text:c">
			<xsl:call-template name="insert-spaces">
				<xsl:with-param name="n" select="@text:c"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text> </xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="insert-spaces">
<xsl:param name="n"/>
<xsl:choose>
    <xsl:when test="$n &lt;= 30">
        <xsl:value-of select="substring($spaces, 1, $n)"/>
    </xsl:when>
    
    <xsl:otherwise>
        <xsl:value-of select="$spaces"/>
        <xsl:call-template name="insert-spaces">
            <xsl:with-param name="n">
                <xsl:value-of select="$n - 30"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:otherwise>
</xsl:choose>
</xsl:template>
<!-- End of space preservation -->

<!-- This template is to manage repeated columns on the table -->
<!-- Access is done with parameters . column 1 -->
<xsl:template name="getColumnValue">
    <xsl:param name="tableRow" as="node()"/>
    <xsl:param name="colIndex"/>
    <xsl:param name="currentIndex"/>
    <xsl:choose>
        <xsl:when test="$currentIndex &lt; $colIndex">
            <xsl:variable name="repeatColumns" select="$tableRow/table:table-cell[$currentIndex]/@table:number-columns-repeated"/>
            <xsl:choose>
               <xsl:when test="$repeatColumns">
                  <xsl:choose>
                     <!-- <xsl:when test="$currentIndex + $repeatColumns - 1 &gt;= $colIndex"><xsl:value-of select="$tableRow/table:table-cell[$currentIndex]"/></xsl:when> -->
                     <xsl:when test="$currentIndex + $repeatColumns - 1 &gt;= $colIndex"><xsl:value-of select="$tableRow/table:table-cell[$currentIndex]"/></xsl:when>
                     <xsl:otherwise>
						<xsl:call-template name="getColumnValue">
							<xsl:with-param name="tableRow" select="$tableRow" />
							<!-- <xsl:with-param name="colIndex" select="$colIndex - $repeatColumns + 1"/> -->
							<xsl:with-param name="colIndex" select="$colIndex - $repeatColumns + 1"/>
							<xsl:with-param name="currentIndex" select="$currentIndex + 1"/>
						</xsl:call-template>
					 </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
               <xsl:otherwise>
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="$tableRow" />
						<xsl:with-param name="colIndex" select="$colIndex"/>
						<xsl:with-param name="currentIndex" select="$currentIndex + 1"/>
					</xsl:call-template>
			   </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
			<xsl:apply-templates select="$tableRow/table:table-cell[$colIndex]"/>
		</xsl:otherwise>
    </xsl:choose>
 </xsl:template>




<xsl:template match="/">
      <xsl:for-each select="//table:table">
		  <hb:RuleSet xmlns:hb="HANDBOOK"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			xsi:schemaLocation="HANDBOOK ../XSD/handbook.xsd ">
			<!-- Process all table-rows after the column labels in table-row 1 -->

			<xsl:for-each select="table:table-row">
				<xsl:variable name="currentUID">
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="." />
						<xsl:with-param name="colIndex" select="1"/>
						<xsl:with-param name="currentIndex" select="1"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="prevUID">
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="./preceding-sibling::*[1]" />
						<xsl:with-param name="colIndex" select="1"/>
						<xsl:with-param name="currentIndex" select="1"/>
					</xsl:call-template>
				</xsl:variable>

				<xsl:if test="not(position()=1)">
					<xsl:if test="not($currentUID = $prevUID)">						
						<hb:Rule>
							<xsl:attribute name="UID"><xsl:value-of select="$currentUID"/></xsl:attribute>
							<xsl:element name="hb:RuleUID">
								<xsl:call-template name="getColumnValue">
									<xsl:with-param name="tableRow" select="." />
									<xsl:with-param name="colIndex" select="2"/>
									<xsl:with-param name="currentIndex" select="1"/>
								</xsl:call-template>
							</xsl:element>
							<hb:RuleHist>
								<xsl:element name="hb:Status">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="3"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Version">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="4"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Creation">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="5"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Modified">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="6"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Revision">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="7"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
							</hb:RuleHist>
							<hb:RuleContent>
								<xsl:element name="hb:Name">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="8"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:IsParent">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="9"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:IsSon">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="10"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								
								<xsl:variable name="parentUID">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="11"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:if test="not($parentUID = '')">
									<xsl:element name="hb:ParentUID">
										<xsl:value-of select="$parentUID" />
									</xsl:element>
								</xsl:if>
								<xsl:if test="$parentUID = ''">
									<hb:ParentUID xsi:nil="true" />
								</xsl:if>


								<xsl:element name="hb:Technology">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="12"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:ApplicationFields">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="13"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Category">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="14"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:SubCategory">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="15"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Severity">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="16"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Rationale">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="17"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:ShortDesc">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="18"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:LongDesc">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="19"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
							</hb:RuleContent>
							<hb:Sonarqube>
								<xsl:element name="hb:SonarType">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="20"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:RemediationEffort">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="21"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:SonarSeverity">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="22"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:SonarTag">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="23"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
							</hb:Sonarqube>
							<hb:RuleDesc>
								<xsl:element name="hb:GoodExDesc">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="24"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:GoodExample">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="25"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:BadExDesc">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="26"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:BadExample">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="27"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:FigureDesc">
									<xsl:call-template name="getColumnValue">
										<xsl:with-param name="tableRow" select="." />
										<xsl:with-param name="colIndex" select="28"/>
										<xsl:with-param name="currentIndex" select="1"/>
									</xsl:call-template>
								</xsl:element>
								<xsl:element name="hb:Figure">
									<xsl:variable name="filename">
										<xsl:call-template name="getColumnValue">
											<xsl:with-param name="tableRow" select="." />
											<xsl:with-param name="colIndex" select="29"/>
											<xsl:with-param name="currentIndex" select="1"/>
										</xsl:call-template>
									</xsl:variable>

									<xsl:if test="not($filename='')">
										<xsl:attribute name="fileref">
											<xsl:value-of select="$filename" />
										</xsl:attribute>
										<xsl:attribute name="height">
											<xsl:call-template name="getColumnValue">
												<xsl:with-param name="tableRow" select="." />
												<xsl:with-param name="colIndex" select="30"/>
												<xsl:with-param name="currentIndex" select="1"/>
											</xsl:call-template>
										</xsl:attribute>
										<xsl:attribute name="width">
											<xsl:call-template name="getColumnValue">
												<xsl:with-param name="tableRow" select="." />
												<xsl:with-param name="colIndex" select="31"/>
												<xsl:with-param name="currentIndex" select="1"/>
											</xsl:call-template>
										</xsl:attribute>
									</xsl:if>
								</xsl:element>
							</hb:RuleDesc>
							<xsl:variable name="paramId">
								<xsl:call-template name="getColumnValue">
									<xsl:with-param name="tableRow" select="." />
									<xsl:with-param name="colIndex" select="32"/>
									<xsl:with-param name="currentIndex" select="1"/>
								</xsl:call-template>
							</xsl:variable>
							<!-- Parameters ? -->
							<xsl:if test="$paramId">
								<xsl:if test="not($paramId = '')">
									<hb:RuleParams>
										<xsl:variable name="recordedPos" select="position()"/>
										<xsl:for-each select="//table:table">
											<xsl:for-each select="table:table-row">
												<xsl:if test="position() &gt;= $recordedPos">
													<xsl:variable name="newUID">
														<xsl:call-template name="getColumnValue">
															<xsl:with-param name="tableRow" select="." />
															<xsl:with-param name="colIndex" select="1"/>
															<xsl:with-param name="currentIndex" select="1"/>
														</xsl:call-template>
													</xsl:variable>
													
													<xsl:if test="$newUID = $currentUID">
														<xsl:call-template name="addParam">
															<xsl:with-param name="currentRow" select="."/>
															<xsl:with-param name="currentUID" select="$currentUID"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
									</hb:RuleParams>
								</xsl:if>						
							</xsl:if>						
						</hb:Rule>
					</xsl:if>
				</xsl:if>
			</xsl:for-each>

			<!-- get the rule history from the second row (first one is title) -->
			<hb:RuleSetHist>
				<xsl:element name="hb:Version">
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="table:table-row[1]" />
						<xsl:with-param name="colIndex" select="36"/>
						<xsl:with-param name="currentIndex" select="1"/>
					</xsl:call-template>
				</xsl:element>
				<xsl:element name="hb:Creation">
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="table:table-row[1]" />
						<xsl:with-param name="colIndex" select="37"/>
						<xsl:with-param name="currentIndex" select="1"/>
					</xsl:call-template>
				</xsl:element>
				<xsl:element name="hb:Modified">
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="table:table-row[1]" />
						<xsl:with-param name="colIndex" select="38"/>
						<xsl:with-param name="currentIndex" select="1"/>
					</xsl:call-template>
				</xsl:element>
				<xsl:element name="hb:Revision">
					<xsl:call-template name="getColumnValue">
						<xsl:with-param name="tableRow" select="table:table-row[1]" />
						<xsl:with-param name="colIndex" select="39"/>
						<xsl:with-param name="currentIndex" select="1"/>
					</xsl:call-template>
				</xsl:element>
			</hb:RuleSetHist>
		</hb:RuleSet>
	</xsl:for-each>
</xsl:template>


<xsl:template name="addParam">
    <xsl:param name="currentRow" as="node()"/>
    <xsl:param name="currentUID"/>
	
	<xsl:variable name="paramId">
		<xsl:call-template name="getColumnValue">
			<xsl:with-param name="tableRow" select="$currentRow" />
			<xsl:with-param name="colIndex" select="32"/>
			<xsl:with-param name="currentIndex" select="1"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- The relation gives the parameter type -->
	<xsl:variable name="paramRelation">
		<xsl:call-template name="getColumnValue">
			<xsl:with-param name="tableRow" select="$currentRow" />
			<xsl:with-param name="colIndex" select="33"/>
			<xsl:with-param name="currentIndex" select="1"/>
		</xsl:call-template>
	</xsl:variable>

	<!-- Is it a String Param ? -->
	<xsl:if test="($paramRelation = 'Prefix') or ($paramRelation = 'Contain') or ($paramRelation = 'Equal') or ($paramRelation = 'Suffix')">
		<hb:StringParam>
			<xsl:element name="hb:ParamID"><xsl:value-of select="$paramId" /></xsl:element>
			<xsl:element name="hb:Position"><xsl:value-of select="$paramRelation" /></xsl:element>
			<xsl:element name="hb:Value">
				<xsl:call-template name="getColumnValue">
					<xsl:with-param name="tableRow" select="$currentRow" />
					<xsl:with-param name="colIndex" select="34"/>
					<xsl:with-param name="currentIndex" select="1"/>
				</xsl:call-template>
			</xsl:element>
		</hb:StringParam>
	</xsl:if>

	<!-- Is it an Integer Param ? -->
	<xsl:if test="($paramRelation = 'LT') or ($paramRelation = 'LET') or ($paramRelation = 'E') or ($paramRelation = 'GET') or ($paramRelation = 'GT')">
		<hb:IntParam>
			<xsl:element name="hb:ParamID"><xsl:value-of select="$paramId" /></xsl:element>
			<xsl:element name="hb:Relation"><xsl:value-of select="$paramRelation" /></xsl:element>
			<xsl:element name="hb:Value">
				<xsl:call-template name="getColumnValue">
					<xsl:with-param name="tableRow" select="$currentRow" />
					<xsl:with-param name="colIndex" select="34"/>
					<xsl:with-param name="currentIndex" select="1"/>
				</xsl:call-template>
			</xsl:element>
		</hb:IntParam>
	</xsl:if>

	<!-- Is it a Range Param ? -->
	<xsl:if test="($paramRelation = 'LT_GT') or ($paramRelation = 'LET_GT') or ($paramRelation = 'LET_GET') or ($paramRelation = 'LT_GET')">
		<hb:RangeParam>
			<xsl:element name="hb:ParamID"><xsl:value-of select="$paramId" /></xsl:element>
			<xsl:element name="hb:Range"><xsl:value-of select="$paramRelation" /></xsl:element>
			<xsl:element name="hb:ValueMin">
				<xsl:call-template name="getColumnValue">
					<xsl:with-param name="tableRow" select="$currentRow" />
					<xsl:with-param name="colIndex" select="34"/>
					<xsl:with-param name="currentIndex" select="1"/>
				</xsl:call-template>
			</xsl:element>
			<xsl:element name="hb:ValueMax">
				<xsl:call-template name="getColumnValue">
					<xsl:with-param name="tableRow" select="$currentRow" />
					<xsl:with-param name="colIndex" select="34"/>
					<xsl:with-param name="currentIndex" select="1"/>
				</xsl:call-template>
			</xsl:element>
		</hb:RangeParam>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
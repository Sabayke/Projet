<?xml version="1.0" encoding="ISO-8859-1"?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<!-- L'attribut exclude-result-prefixes de xsl:stylesheet permet d'indiquer que certains espaces de noms ne seront pas utilisés dans le document résultat et que leurs déclarations doivent être omises. Cet attribut contient une liste de préfixes séparés par des espaces.-->
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>

<xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"> 
            <fo:layout-master-set> 
                <fo:simple-page-master master-name="mypage"> 
                    <fo:region-body margin="1in"/> 
                </fo:simple-page-master> 
            </fo:layout-master-set> 
            <fo:page-sequence master-reference="mypage"> 
                <fo:flow flow-name="xsl-region-body"> 
                    <fo:block>Bundesliga 2020-2021</fo:block> 
                    <fo:block font-size="10pt">
                        <fo:table  table-layout="fixed" border-style="solid" text-align="center">
                          <fo:table-column column-width="4cm"/>
						  <fo:table-column column-width="4cm"/>
						  <fo:table-column column-width="4cm"/>
						  <fo:table-column column-width="4cm"/>
                           <fo:table-header>
                              <fo:table-row> 
                                 <fo:table-cell border-style="solid">
									<fo:block>Equipe</fo:block>
								 </fo:table-cell> 
                                 <fo:table-cell border-style="solid">
									<fo:block>Victoires</fo:block>
                                 </fo:table-cell> 
                                 <fo:table-cell border-style="solid">
									<fo:block>Defaites</fo:block>
								 </fo:table-cell> 
                                 <fo:table-cell border-style="solid">
									<fo:block>Classement</fo:block>
								 </fo:table-cell> 
                              </fo:table-row>
                           </fo:table-header>
                           <fo:table-body>        
                             <xsl:for-each select="statistiques_equipe/equipe">
                                <xsl:sort select="classement" data-type="number" order="ascending"/>
                                   <xsl:choose>
												<xsl:when test="classement &lt; 4">
													<fo:table-row background-color="LightGreen"> 
														<fo:table-row> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="equipe"/>
																</fo:block>
															</fo:table-cell> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="victoires"/>
																</fo:block>
															</fo:table-cell> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="defaites"/>
																</fo:block>
															</fo:table-cell> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="classement"/>
																</fo:block>
															</fo:table-cell> 
														</fo:table-row>
													</fo:table-row>
												</xsl:when>
												<xsl:when test="classement &gt; 15">
													<fo:table-row background-color="#FF7F7F"> 
														<fo:table-row> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="equipe"/>
																</fo:block>
															</fo:table-cell> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="victoires"/>
																</fo:block>
															</fo:table-cell> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="defaites"/>
																</fo:block>
															</fo:table-cell> 
															<fo:table-cell border-style="solid">
																<fo:block>
																	<xsl:value-of select="classement"/>
																</fo:block>
															</fo:table-cell> 
														</fo:table-row>
													</fo:table-row>
												</xsl:when>
												<xsl:otherwise>
													 <fo:table-row> 
														<fo:table-cell border-style="solid">
															<fo:block>
																<xsl:value-of select="equipe"/>
															</fo:block>
														</fo:table-cell> 
														<fo:table-cell border-style="solid">
															<fo:block>
																<xsl:value-of select="victoires"/>
															</fo:block>
														</fo:table-cell> 
														<fo:table-cell border-style="solid">
															<fo:block>
																<xsl:value-of select="defaites"/>
															</fo:block>
														</fo:table-cell> 
														<fo:table-cell border-style="solid">
															<fo:block>
																<xsl:value-of select="classement"/>
															</fo:block>
														</fo:table-cell> 
													 </fo:table-row>
												</xsl:otherwise>
								   </xsl:choose> 
                             </xsl:for-each>
                           </fo:table-body>         
                        </fo:table>
                    </fo:block> 
                </fo:flow> 
            </fo:page-sequence> 
        </fo:root> 
    </xsl:template>
</xsl:stylesheet>
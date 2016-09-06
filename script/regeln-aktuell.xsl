<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match="@*|node()">
	<xsl:choose>
		<xsl:when test="@gestrichenam">
		</xsl:when>
		<xsl:otherwise>
			<xsl:copy>
				<xsl:apply-templates select="@*|node()"/>
			</xsl:copy>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="@eingefuegtam">
</xsl:template>

<xsl:template match="@nachgefuehrtam">
</xsl:template>

</xsl:stylesheet>

<!--
erstellt ein XML, das nur die aktuelle Fassung enthält, nicht die Historie
(nützlich zur Vorbereitungen von Änderungsvorlagen im Vorstand und dergleichen)
-->

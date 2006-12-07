<?xml version="1.0" encoding="utf-8"?>

<!--

XSLT conversion specification for 'SKGB-Regeln' to HTML
(c) 2005-2009 Segel- und Kanugemeinschaft Brucher Talsperre (SKGB)
Proprietary/Confidential. All Rights Reserved.

-->


<!-- format version: SKGB-Regeln 0.5 -->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:regeln="http://www.skgb.de/2005/regeln">

	<!-- Need to instruct the XSLT processor to use HTML output rules.
		 See http://www.w3.org/TR/xslt#output for more details
	-->
	<xsl:output method="html" media-type="text/html" encoding="utf-8" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd" omit-xml-declaration="yes" indent="no"/>
	
	
	
	<xsl:template match="/">
		<HTML LANG="de">
		<STYLE TYPE="text/css">
			<xsl:text>
HTML {
	margin: 8px;
}
BODY {
	margin: 0;
}
INS, INS * {
	text-decoration: none;
}
DEL, DEL * {
	display: none;
}
/*
INS, INS * {
	background: #7f7;
}
DEL, DEL * {
	background: #f77;
}
*/
H1 {
	counter-reset: sections;
	font-size: 1.5em;
	font-weight: normal;
	text-align: center;
}
H2:before {
	content: '§ 'counter(sections)' ';
	counter-increment: sections;
	padding-right: 1ex;
}
H2 {
	font-size: 1em;
}
.preamble, .up-to-date, .signature {
	font-style: italic;
}
P.up-to-date {
	margin-bottom: 0;
}
ADDRESS.signature SPAN.signature {
	padding-top: 56px;
	display: inline-block;
	background-repeat: no-repeat;
	background-position: 0 5px;
	background-image: url(data:image/gif;base64,R0lGODlhMAAwAJEAAP%2F%2F%2FzxGUre7wXeAiiH5BAEAAAAALAAAAAAwADAAAAL%2FhI95MhP%2FhhCq2osYjNpxDFoCJI1DpQVUGI7PCjTUhL7s5cKGxEtR4ropHCcDjdGIEFWN2E4lfMI6qlck0PBIFtCbY%2FX9GnWT5LcLwLIcCCUal20e1JjRyro1ejZoJHKuo6BCg4WmRQNQBnGQNZJoZ2EVkPhgZIPzEyPD5qjQSVIkxmKy07FT1IYqyhaVNqlpCPS6QMHaqlkqx4AgJ3vLFQqZ1jaWaPAmRAQpg9TF6lE7e2P6dFoi52yDjKHsBPj49VkzmmUU89fkV9ppfAqiTltYIs04MYu6rSdXhJSlvVCPSKNjKGTwYoIFWrMZlTRtSkKQl8EFPbp1WPajH6WG96%2FgGesX51qeNDN0laOWcGQif40mmAi0LQ5FHycoTGoUx2W5CoMSzDumBUrKliU8eqpSs5ZNoFvSKTHYL9AQHotIWnVI6VjKMioxDOK6o5TWImqKdpvW0dyurCud6qETRY2LpjDuGRQodc2sqtLivIHbCtKRWqgoMQgkLIqwTMN8FoYKOISoQq96tVmRY04%2BWdlKsD1qqcvhD0MYn7mT190jzdH4bMiTwi6IyNAkDlwZ43W1EHBNMKbHMOElW7z5yUvyQqfrhp%2B9zBotiYRwf4Z%2FEUnlr1Cas9R%2BZabFtWY7SoV%2Fve1acKJ5Ty6wuNQpcP00v7dbFQAAOw==);
}
			</xsl:text>
		</STYLE>
			<TITLE><xsl:value-of select="//regeln:name"/></TITLE>
			<xsl:apply-templates/>
		</HTML>
	</xsl:template>
	
	<xsl:template match="regeln:name">
		<H1>
			<xsl:apply-templates/>
		</H1>
	</xsl:template>
	
	<xsl:template match="regeln:satzung">
		<DIV CLASS="bylaws">
			<xsl:apply-templates/>
		</DIV>
	</xsl:template>
	
	<xsl:template match="regeln:ordnung">
		<DIV CLASS="rules">
			<xsl:apply-templates/>
		</DIV>
	</xsl:template>
	
	<xsl:template match="regeln:vorschrift">
		<DIV CLASS="directive">
			<xsl:apply-templates/>
		</DIV>
	</xsl:template>
	
	<xsl:template match="regeln:praeambel">
		<P CLASS="preamble">
			<xsl:apply-templates/>
		</P>
	</xsl:template>
	
	<xsl:template match='regeln:p'>
		<H2><xsl:value-of select="regeln:titel"/></H2>
		<xsl:choose>
			<xsl:when test="regeln:abs">
				<OL>
					<xsl:apply-templates/>
				</OL>
			</xsl:when>
			<xsl:otherwise>
				<DIV>
					<xsl:apply-templates/>
				</DIV>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:abs'>
		<xsl:call-template name="list-item"/>
	</xsl:template>
	
	<xsl:template name='list-item'>
		<LI>
			<xsl:apply-templates/>
		</LI>
	</xsl:template>
	
	<xsl:template match='regeln:titel'>
	</xsl:template>
	
	<xsl:template match='regeln:s'>
		<xsl:call-template name="ins-del"/>
	</xsl:template>
	
	<xsl:template name='ins-del'>
		<xsl:choose>
			<xsl:when test="attribute::gestrichenam">
				<DEL DATETIME="{attribute::gestrichenam}">
					<xsl:apply-templates/>
				</DEL>
			</xsl:when>
			<xsl:when test="attribute::eingefuegtam">
				<INS DATETIME="{attribute::eingefuegtam}">
					<xsl:apply-templates/>
				</INS>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:lit[1]'>
		<OL TYPE="a">
			<xsl:call-template name="list-item"/>
			<xsl:for-each select="following-sibling::*[local-name()='lit']">
				<xsl:call-template name="list-item"/>
			</xsl:for-each>
		</OL>
	</xsl:template>
	
	<xsl:template match='regeln:lit'>
	</xsl:template>
	
	<xsl:template match='regeln:gestrichen'>
		<!-- SKGB-Regeln pre-0.5 -->
		<xsl:choose>
			<xsl:when test="attribute::am">
				<DEL DATETIME="{attribute::am}">
					<xsl:apply-templates/>
				</DEL>
			</xsl:when>
			<xsl:otherwise>
				<DEL>
					<xsl:apply-templates/>
				</DEL>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:eingefuegt'>
		<!-- SKGB-Regeln pre-0.5 -->
		<xsl:choose>
			<xsl:when test="attribute::am">
				<INS DATETIME="{attribute::am}">
					<xsl:apply-templates/>
				</INS>
			</xsl:when>
			<xsl:otherwise>
				<INS>
					<xsl:apply-templates/>
				</INS>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:aktuell'>
		<xsl:choose>
			<xsl:when test="attribute::den">
				<P CLASS="up-to-date">
					Marienheide, den <xsl:value-of select="attribute::den"/><BR/>
				</P>
				<ADDRESS CLASS="signature">
					Segel- und Kanugemeinschaft Brucher Talsperre<BR/>
					<SPAN CLASS="signature">Der Vorstand</SPAN>
				</ADDRESS>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:dump'>
		<PRE>
			<xsl:apply-templates/>
		</PRE>
	</xsl:template>
	
</xsl:transform>

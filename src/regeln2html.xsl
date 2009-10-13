<?xml version="1.0" encoding="utf-8" standalone="yes"?>

<!--

XSLT conversion specification for 'SKGB-Regeln' to HTML
(c) 2005-2009 Segel- und Kanugemeinschaft Brucher Talsperre (SKGB)
Proprietary/Confidential. All Rights Reserved.

-->


<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:regeln="http://www.skgb.de/2005/regeln" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="regeln html">
	
	<xsl:template name='check-version'>
		<xsl:variable name="version" select="number(0.6)"/><!-- SKGB-Regeln format version -->
		
		<xsl:if test="number(.//@version) &lt; $version">
			<xsl:message>
				<xsl:text>Warning: Document Format Version Mismatch! The processed document conforms to version </xsl:text>
				<xsl:value-of select="number(.//@version)"/>
				<xsl:text> of 'SKGB-Regeln', but this XSLT is made for version </xsl:text>
				<xsl:value-of select="$version"/>
				<xsl:text>. The results may not be what you expect.</xsl:text>
			</xsl:message>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:namespace-alias stylesheet-prefix="html" result-prefix="#default"/>

	<!-- Need to instruct the XSLT processor to use HTML output rules.
		 See http://www.w3.org/TR/xslt#output for more details
	-->
	<xsl:output method="xml" media-type="application/xhtml+xml" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" omit-xml-declaration="no" standalone="no" indent="no"/>
		
	<xsl:template match="html:*">
		<!--xsl:copy><xsl:apply-templates/></xsl:copy-->
		<xsl:element name="{local-name()}"><xsl:apply-templates/></xsl:element>
	</xsl:template>
	
	<xsl:template match="/">
		<xsl:call-template name="check-version"/>
		<xsl:processing-instruction name="xml-stylesheet">href="#style" type="text/css"</xsl:processing-instruction>
		<html xml:lang="de">
		<head>
		<style type="text/css" id="style">
			<xsl:text>
html {
	margin: 8px;
}
body {
	margin: 0;
}
pre {
	width: 100%;
	white-space: pre-line;
	font-size: 92%;
	font-family: monospace;
	font-family: "Courier", "CMU Typewriter Text", "Free Mono", "Prestige Elite Std", "Courier New";
}
ins, ins * {
	text-decoration: none;
}
del, del * {
	display: none;
}
/*
ins, ins * {
	background: #7f7;
}
del, del * {
	background: #f77;
}
*/
h1 {
	counter-reset: sections;
	font-size: 1.5em;
	font-weight: normal;
	text-align: center;
	background-image: url(logo_skgb.gif);
	background-repeat: no-repeat;
	background-position: center top;
	padding-top: 107px;
}
h2:before {
	content: '§ 'counter(sections)' ';
	counter-increment: sections;
	padding-right: 1ex;
}
h2 {
	font-size: 1em;
}
.preamble, .up-to-date, .signature {
	font-style: italic;
}
.preamble:before {
	content: 'Präambel: ';
}
p.up-to-date {
	margin-bottom: 0;
}
address.signature span.signature {
	padding-top: 56px;
	display: inline-block;
	background-repeat: no-repeat;
	background-position: 0 5px;
	background-image: url(data:image/gif;base64,R0lGODlhMAAwAJEAAP%2F%2F%2FzxGUre7wXeAiiH5BAEAAAAALAAAAAAwADAAAAL%2FhI95MhP%2FhhCq2osYjNpxDFoCJI1DpQVUGI7PCjTUhL7s5cKGxEtR4ropHCcDjdGIEFWN2E4lfMI6qlck0PBIFtCbY%2FX9GnWT5LcLwLIcCCUal20e1JjRyro1ejZoJHKuo6BCg4WmRQNQBnGQNZJoZ2EVkPhgZIPzEyPD5qjQSVIkxmKy07FT1IYqyhaVNqlpCPS6QMHaqlkqx4AgJ3vLFQqZ1jaWaPAmRAQpg9TF6lE7e2P6dFoi52yDjKHsBPj49VkzmmUU89fkV9ppfAqiTltYIs04MYu6rSdXhJSlvVCPSKNjKGTwYoIFWrMZlTRtSkKQl8EFPbp1WPajH6WG96%2FgGesX51qeNDN0laOWcGQif40mmAi0LQ5FHycoTGoUx2W5CoMSzDumBUrKliU8eqpSs5ZNoFvSKTHYL9AQHotIWnVI6VjKMioxDOK6o5TWImqKdpvW0dyurCud6qETRY2LpjDuGRQodc2sqtLivIHbCtKRWqgoMQgkLIqwTMN8FoYKOISoQq96tVmRY04%2BWdlKsD1qqcvhD0MYn7mT190jzdH4bMiTwi6IyNAkDlwZ43W1EHBNMKbHMOElW7z5yUvyQqfrhp%2B9zBotiYRwf4Z%2FEUnlr1Cas9R%2BZabFtWY7SoV%2Fve1acKJ5Ty6wuNQpcP00v7dbFQAAOw==);
}
			</xsl:text>
		</style>
			<title><xsl:value-of select="//regeln:name"/></title>
			</head>
			<body>
			<xsl:apply-templates/>
			<!--xsl:apply-templates select="descendant-or-self::regeln:regeln/*"/-->
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="regeln:name">
		<h1>
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
	
	<xsl:template match="regeln:satzung">
		<div class="bylaws">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="regeln:ordnung">
		<div class="rules">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="regeln:vorschrift">
		<div class="directive">
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	
	<xsl:template match="regeln:praeambel">
		<p class="preamble">
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	
	<xsl:template match='regeln:p'>
		<h2><xsl:value-of select="regeln:titel"/></h2>
		<xsl:choose>
			<xsl:when test="regeln:abs">
				<ol>
					<xsl:apply-templates/>
				</ol>
			</xsl:when>
			<xsl:otherwise>
				<div>
					<xsl:apply-templates/>
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:abs'>
		<xsl:call-template name="list-item"/>
	</xsl:template>
	
	<xsl:template name='list-item'>
		<li>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	
	<xsl:template match='regeln:titel'>
	</xsl:template>
	
	<xsl:template match='regeln:s'>
		<xsl:call-template name="ins-del"/>
	</xsl:template>
	
	<xsl:template name='ins-del'>
		<xsl:choose>
			<xsl:when test="attribute::gestrichenam">
				<del datetime="{attribute::gestrichenam}">
					<xsl:apply-templates/>
				</del>
			</xsl:when>
			<xsl:when test="attribute::eingefuegtam">
				<ins datetime="{attribute::eingefuegtam}">
					<xsl:apply-templates/>
				</ins>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:lit[1]'>
		<ol type="a">
			<xsl:call-template name="list-item"/>
			<xsl:for-each select="following-sibling::*[local-name()='lit']">
				<xsl:call-template name="list-item"/>
			</xsl:for-each>
		</ol>
	</xsl:template>
	
	<xsl:template match='regeln:lit'>
	</xsl:template>
	
	<xsl:template match='regeln:aktuell'>
		<xsl:choose>
			<xsl:when test="attribute::den">
				<p class="up-to-date">
					Marienheide, den <xsl:value-of select="attribute::den"/><br/>
				</p>
				<address class="signature">
					Segel- und Kanugemeinschaft Brucher Talsperre<br/>
					<span class="signature">Der Vorstand</span>
				</address>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:dump'>
		<pre>
			<xsl:apply-templates/>
		</pre>
	</xsl:template>
	
</xsl:transform>

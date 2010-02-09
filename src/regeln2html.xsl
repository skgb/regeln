<?xml version="1.0" encoding="utf-8" standalone="yes"?>

<!--

XSLT conversion specification for 'SKGB-Regeln' to HTML
(c) 2005-2009 Segel- und Kanugemeinschaft Brucher Talsperre (SKGB)
Proprietary/Confidential. All Rights Reserved.

-->


<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:regeln="http://www.skgb.de/2005/regeln" xmlns="http://www.w3.org/1999/xhtml" xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="regeln html">
	
	<xsl:template name='check-version'>
		<xsl:variable name="version" select="number(0.61)"/><!-- SKGB-Regeln format version -->
		
		<xsl:if test="number(/.//regeln:regeln//@version) &lt; $version">
			<xsl:message>
				<xsl:text>Warning: Document Format Version Mismatch! The processed document conforms to version </xsl:text>
				<xsl:value-of select="number(/.//regeln:regeln//@version)"/>
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
				<title>
					<xsl:value-of select="//regeln:name"/>
					<xsl:text> SKGB</xsl:text>
				</title>
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
del, del *, ins del, ins del * {
	background: #f77;
}
h1 {
	counter-reset: sections;
	font-size: 1.5em;
	font-weight: normal;
	text-align: center;
	background-image: url(logo_skgb.gif);
	background-repeat: no-repeat;
	background-position: center top;
	padding-top: 107px;
	margin-bottom: 0;
}
p.stand {
	text-align: center;
	margin: .5em 0 2em;
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
				<link rel="stylesheet" title="Änderungen verbergen" type="text/css" href="data:text/css,ins%2Cins%20*%7Btext-decoration%3Anone%7Ddel%2Cdel%20*%7Bdisplay%3Anone%7D"/>
				<link rel="alternate stylesheet" title="Änderungen zeigen" type="text/css" href="data:text/css,ins%2Cins%20*%7Bbackground%3A%237f7%7Dspan.geaendert%7Bbackground%3A%23ff7%7D"/>
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
		<p class="stand">
			<xsl:choose>
				<xsl:when test="..//regeln:stand/@stand">
					<xsl:call-template name="fassung-vom">
						<xsl:with-param name="stand" select="..//regeln:stand/@stand"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="..//regeln:stand">
					<xsl:call-template name="fassung-vom">
						<xsl:with-param name="stand" select="..//regeln:stand"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="..//@stand">
					<xsl:call-template name="fassung-vom">
						<xsl:with-param name="stand" select="..//@stand"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="fassung-vom"/>
				</xsl:otherwise>
			</xsl:choose>
		</p>
	</xsl:template>
	
	<xsl:template name='fassung-vom'>
		<xsl:param name="stand"/>
		<xsl:if test="$stand">
			<xsl:text>in der Fassung vom </xsl:text>
			<xsl:value-of select="$stand"/>
		</xsl:if>
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
		<xsl:call-template name="ins-del"/>
	</xsl:template>
	
	<xsl:template match='regeln:p' mode="ins-del">
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
		<li>
			<xsl:call-template name="ins-del"/>
		</li>
	</xsl:template>
	
	<xsl:template match='regeln:abs' mode="ins-del">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match='regeln:titel'>
	</xsl:template>
	
	<xsl:template match='regeln:s'>
		<xsl:call-template name="ins-del"/>
	</xsl:template>
		
	<xsl:template match='regeln:s' mode="ins-del">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match='regeln:steil'>
		<xsl:call-template name="ins-del"/>
	</xsl:template>
	
	<xsl:template match='regeln:steil' mode="ins-del">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match='regeln:bereich'>
		<xsl:call-template name="ins-del"/>
	</xsl:template>
		
	<xsl:template match='regeln:bereich' mode="ins-del">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template name='ins-del'>
		<xsl:choose>
			<xsl:when test="@gestrichenam">
				<del datetime="{@gestrichenam}" title="gestrichen am {@gestrichenam}">
					<xsl:apply-templates select="." mode="ins-del"/>
				</del>
			</xsl:when>
			<xsl:when test="@eingefuegtam">
				<ins datetime="{@eingefuegtam}" title="eingefügt am {@eingefuegtam}">
					<xsl:apply-templates select="." mode="ins-del"/>
				</ins>
			</xsl:when>
			<xsl:when test="@nachgefuehrtam">
				<span class="geaendert">
					<xsl:apply-templates select="." mode="ins-del"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="." mode="ins-del"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match='regeln:lit[1]'>
		<ol type="a">
			<li>
				<xsl:apply-templates/>
			</li>
			<xsl:for-each select="following-sibling::*[local-name()='lit']">
				<li>
					<xsl:apply-templates/>
				</li>
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

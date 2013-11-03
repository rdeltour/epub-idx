<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:x="http://www.jenitennison.com/xslt/xspec"
    xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs x"
    version="2.0">
    
    <xsl:template match="html">
        <x:description stylesheet="../schema/schema-compiled.xsl">
            <xsl:apply-templates select="body/*[@class=('valid','invalid')]"/>
        </x:description>
    </xsl:template>

    <xsl:template match="body/*[@class=('valid','invalid')]">
        <x:scenario label="{@title}">
            <x:context href="resources/test-{generate-id()}.xhtml"/>
            <x:expect label="should be {@class}"
                test="{if (@class='valid') then 'empty' else 'exists'}(//svrl:failed-assert)"/>
        </x:scenario>
        <xsl:result-document href="resources/test-{generate-id()}.xhtml">
            <html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"
                xml:lang="en-US" lang="en-US">
                <head>
                    <meta charset="UTF-8" />
                    <title>test index</title>
                </head>
                <body>
                   <xsl:copy-of select="."/> 
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>


</xsl:stylesheet>

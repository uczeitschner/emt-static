<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:slash="http://purl.org/rss/1.0/modules/slash/" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>


    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//channel/title[1]/text()"/>
        </xsl:variable>
        <html class="h-100">
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"/>
                </xsl:call-template>
            </head>

            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main class="flex-shrink-0">
                    <div class="container-md">
                        <h1 class="display-3 text-center">
                            <xsl:value-of select="$doc_title"/>
                        </h1>
                        <xsl:for-each select=".//item">
                            <div class="pb-5">
                                <h2 class="display-6 text-center">
                                    <xsl:value-of select="./title"/>
                                </h2>
                                <p class="text-center text-muted">
                                    <i class="bi bi-person pe-2"></i>
                                    <xsl:value-of select="./dc:creator" disable-output-escaping="yes"/>
                                </p>
                                <p class="text-center"><xsl:for-each select="./category">
                                    <span class="badge bg-primary p-1 m-1">
                                        <xsl:value-of select="." disable-output-escaping="yes"/>
                                    </span>
                                </xsl:for-each></p>
                                <xsl:value-of select="./description" disable-output-escaping="yes"/>
                                </div>
                        </xsl:for-each>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

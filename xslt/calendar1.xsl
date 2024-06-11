<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title" select="'Briefkalender'"/>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="de">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            <link rel="stylesheet" href="https://unpkg.com/@acdh-oeaw/calendar-component/dist/calendar.css" />
            <link rel="stylesheet" href="css/calendar.css" />


            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>

                    <div class="container-fluid">

                        <h1 class="text-center display-3 p-3">
                                    Kalender</h1>
                        <a style="padding-left:5px;" href="js-data/calendarData.js">
                            <i class="fas fa-download" title="Data"/>
                        </a>
                        <acdh-ch-calendar>
                            <div class="row">
                                <div class="col-2">
                                    <label>
                                        <span>Select a year: </span>
                                        <acdh-ch-calendar-year-picker></acdh-ch-calendar-year-picker>
                                    </label>
                                </div>
                                <div class="col-10">
                                    <acdh-ch-calendar-year></acdh-ch-calendar-year>
                                </div>
                            </div>
                        </acdh-ch-calendar>
                    </div>
                </div>
                <xsl:call-template name="html_footer"/>
                <script type="module" src="js/calendar1.js"></script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
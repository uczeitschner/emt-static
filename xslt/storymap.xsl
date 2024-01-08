<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes" omit-xml-declaration="yes"/>
    
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:import href="./partials/shared.xsl"/>
    
    
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="'Storymap'"/>
        </xsl:variable>
        
        
        
        <html class="h-100">
            
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>
                <link rel="stylesheet" href="https://cdn.knightlab.com/libs/storymapjs/latest/css/storymap.css"></link>
                    <script type="text/javascript" src="https://cdn.knightlab.com/libs/storymapjs/latest/js/storymap-min.js"></script>
            </head>
            
            <body class="d-flex flex-column h-100">
                <xsl:call-template name="nav_bar"/>
                <main>
                    <div class="container-fluid">                        
                        <div id="mapdiv" style="width: 100%; height: 800px;"></div>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
                <script>
                    var storymap_data = 'js-data/storymap.json';
                    var storymap_options = {};
                    var storymap = new KLStoryMap.StoryMap('mapdiv', storymap_data, storymap_options);
                    window.onresize = function (event) {
                        storymap.updateDisplay();
                    }
                </script>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>

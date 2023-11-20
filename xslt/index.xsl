<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:local="http://dse-static.foo.bar"
    version="2.0" exclude-result-prefixes="xsl tei xs local">

    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"
        omit-xml-declaration="yes"/>


    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select='"EMT"'/>
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
                    <div id="carouselExampleCaptions" class="carousel slide">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCaptions"
                                data-bs-slide-to="0" class="active" aria-current="true"
                                aria-label="Slide 1"/>
                            <button type="button" data-bs-target="#carouselExampleCaptions"
                                data-bs-slide-to="1" aria-label="Slide 2"/>
                            <button type="button" data-bs-target="#carouselExampleCaptions"
                                data-bs-slide-to="2" aria-label="Slide 3"/>
                        </div>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="img/banner_2.jpg" class="d-block w-100" alt="..."/>
                                <!--<div class="carousel-caption text-center">
                                        <h1 class="display-2">EMT</h1>
                                        
                                    </div>-->
                            </div>
                            <!--<div class="carousel-item">
                                <img src="..." class="d-block w-100" alt="..."/>
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Second slide label</h5>
                                        <p>Some representative placeholder content for the second slide.</p>
                                    </div>
                            </div>-->
                            <!--<div class="carousel-item">
                                <img src="..." class="d-block w-100" alt="..."/>
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Third slide label</h5>
                                        <p>Some representative placeholder content for the third slide.</p>
                                    </div>
                            </div>-->
                        </div>
                        <!--<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>-->
                        <!--<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>-->
                    </div>
                    <div class="container">
                        <h1 class="text-center display-1">EMT</h1>
                        <h2 class="text-center display-4">Familiensache. Dynastische Handlungsspielräume in
                            der Korrespondenz von Kaiserin Eleonora Magdalena von Pfalz-Neuburg
                            (1655-1720)</h2>
                        <p class="text-center pt-3">Zwischen 1677 und 1716 gingen eine Unzahl von Briefen
                            hin und her zwischen Wien, Düsseldorf und Heidelberg: Kaiserin Eleonora
                            Magdalena korrespondierte mit Vater bzw. Bruder, den Kurfürsten von der
                            Pfalz. Erstmals wird hier die umfangreiche Korrespondenz im Volltext
                            zugänglich gemacht. </p>
                    </div>
                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}">
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="tei:p">
        <p id="{generate-id()}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:list">
        <ul id="{generate-id()}">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="tei:item">
        <li id="{generate-id()}">
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="@target"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

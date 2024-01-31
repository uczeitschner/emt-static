<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:local="http://dse-static.foo.bar" xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:slash="http://purl.org/rss/1.0/modules/slash/" version="3.0"
    exclude-result-prefixes="xsl tei xs local">

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
                <div id="carouselExampleCaptions" class="carousel slide">

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="img/banner_2.jpg" class="d-block w-100" alt="..."/>
                        </div>
                    </div>
                </div>
                <main class="flex-shrink-0">


                    <div class="row p-3">
                        <div class="col-2"/>
                        <div class="col-8">
                            <p class="text-center fs-4">Zwischen 1677 und 1716 gingen eine Unzahl
                                von Briefen hin und her zwischen Wien, Düsseldorf und Heidelberg:
                                Kaiserin Eleonora Magdalena korrespondierte mit Vater bzw. Bruder,
                                den Kurfürsten von der Pfalz. Erstmals wird hier die umfangreiche
                                Korrespondenz im Volltext zugänglich gemacht. </p>
                            <div class="d-grid gap-2 col-6 mx-auto p-3">
                                <a href="about.html" type="button"
                                    class="btn btn-outline-secondary btn-lg button-custom">Über das
                                    Projekt</a>
                            </div>
                        </div>
                        <div class="col-2"/>
                    </div>
                    <div class="container">
                        <hr class="hr-custom"/>
                    </div>
                    
                    <div>
                        <div class="image-container">
                        <img src="img/slider_karlsruhe_778811_00085.jpg" class="img-fluid" alt="Responsive Image" />
                            <div class="image-text">
                                <h2 class="display-3"> Briefverzeichnis </h2>
                                <p class="text-start fs-4">In die erschlossenen Korrespondenzen kann
                                    über eine tabellarische sowie eine kalendarische Ansicht
                                    eingestiegen werden. </p>
                            </div>
                        </div>
                    </div>

                    

                    <hr class="hr-custom"/>
                    <h2 class="text-center display-4 p-5">Biographien</h2>
                    <div class="row justify-content-center">

                        <div class="col">
                            <div class="card" style="width: 18rem;">
                                <a href="philippwilhelm.html">
                                    <img src="img/johann_wilhelm.jpg" class="card-img-top"
                                        alt="Portrait von Johann Wilhelm von Pfalz-Neuburg"/>
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">Johann Wilhelm von Pfalz-Neuburg</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                                <a href="eleonora.html">
                                    <img src="img/eleonora_magdalena.jpg" class="card-img-top"
                                        alt="Portrait von Eleonora Magdalena von Pfalz-Neuburg"/>
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">Eleonora Magdalena von Pfalz-Neuburg</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                                <a href="johannwilhelm.html">
                                    <img src="img/philip_wilhelm.jpg" class="card-img-top"
                                        alt="Portrait von Philip Wilhelm von Pfalz-Neuburg"/>
                                </a>
                                <div class="card-body">
                                    <h5 class="card-title">Philip Wilhelm von Pfalz-Neuburg</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                </main>
                <xsl:call-template name="html_footer"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

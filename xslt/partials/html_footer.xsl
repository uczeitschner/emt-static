<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        <footer class="footer mt-auto py-3 bg-body-tertiary">
            
            <div class="container">
                <div class="d-flex justify-content-center pb-4">
                    
                        <a href="https://www.oeaw.ac.at/" target="_blank" rel="noopener" aria-label="OEAW">
                            <img src="logos/oeaw-logo-transparent.png" alt="OEAW" title="Austrian Academy of Sciences"/>
                        </a>
                    
                </div>
                
                <div class="row justify-content-between pb-4">
                    <div class="col-sm-4">
                        <a href="https://www.oeaw.ac.at/ihb/" target="_blank" rel="noopener" aria-label="IHB">
                            <img src="logos/ihb-logo-en-text.png" alt="IHB" title="Institut for Habsburg and Balkan Studies"/>
                        </a>
                    </div>
                    <div class="col-sm-4">
                        Institute for Habsburg and Balkan Studies<br/>
                        Dominikanerbastei 16<br/>
                        1010 Vienna (Austria)<br/>
                    </div>
                </div>
                
                <div class="row justify-content-between pb-4">
                    <div class="col-sm-4">
                        <a href="https://www.oeaw.ac.at/acdh/" target="_blank" rel="noopener" aria-label="ACDH">
                            <img src="logos/acdh_logo_with_text.svg" alt="ACDH" title="Austrian Centre for Digital Humanities and Cultural Heritage (ACDH-CH) of the Austrian Academy of Sciences"/>
                        </a>
                    </div>
                    <div class="col-sm-4">
                        Austrian Centre for Digital Humanities and Cultural Heritage<br/>
                        Bäckerstraße 13<br/>
                        1010 Vienna<br/>
                    </div>
                </div>
                
                <div class="d-flex justify-content-center">
                        <a href="https://www.fwf.ac.at/" target="_blank" rel="noopener" aria-label="FWF">
                            <img src="logos/fwf-logo-transparent.png" alt="FWF" title="FWF Science-Fond" style="max-width: 300px"/>
                        </a>
                </div>
                
            </div>
            <div class="float-end me-3">
                <a href="{$github_url}"><i class="bi bi-github"></i></a>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        
        <script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>
        <script>
            function addDarkmodeWidget() {
                new Darkmode().showWidget();
            }
            window.addEventListener('load', addDarkmodeWidget);
        </script>
        <script src="js/i18n.js"></script>
        
    </xsl:template>
</xsl:stylesheet>
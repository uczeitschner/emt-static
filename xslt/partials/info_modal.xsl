<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:local="http://dse-static.foo.bar"
    xmlns:mam="whatever" version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>
    
    <xsl:template name="info_modal">
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Erläuterungen zum Textkritischen Markup</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Schließen"></button>
                    </div>
                    <div class="modal-body">
                        <dl>
                            <dt>Entitäten</dt>
                            <dd class="ps-2">Entitäten wie <span class="entity entity-person">Personen</span>, <span class="entity entity-place">Orte</span> oder <span class="entity entity-org"><a data-bs-toggle="modal" data-bs-target="#emt_institution_id__15">Institutionen</a></span> werden farblich hervorgehoben.</dd>
                            <dd class="ps-2">Ein Mouseklick auf eine solche Entität öffnet ein Fenster mit weiteren Informationen zu dieser Entität.</dd>
                            <dt>Abkürzungen</dt>
                            <dd class="ps-2"><small>Beispiel: </small> <abbr class="abbr" title="Abgekürzt: g">gnaden</abbr></dd>
                            <dd class="ps-2">Abkürzunge werden <span class="abbr">mit Blauer Schrift</span> markiert und falls möglich aufgelöst. Die Abkürzung aus dem Original wird <abbr title="Das ist ein Tooltip">mittels Tooltip</abbr> angezeigt.</dd>
                            <dt>Softkorrekturen/Durchstreichungen</dt>
                            <dd class="ps-2"><small>Beispiel: </small>die ich mit <span class="seg-blackening">gehors</span>  trewester deuotion</dd>
                            <dd class="ps-2">Softkorrekturen/Durchstreichungen werden <span class="seg-blackening">durchgestrichen und mit Blauer Schrift</span> markiert.</dd>
                        </dl>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Schließen</button>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
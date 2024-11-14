<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="2.0">
    <xsl:include href="./params.xsl"/>
    <xsl:template match="/" name="html_head">
        <xsl:param name="html_title" select="$project_short_title"></xsl:param>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-title" content="{$html_title}" />
        <meta name="msapplication-TileColor" content="#ffffff" />
        <meta name="msapplication-TileImage" content="{$project_logo}" />
        <link rel="None" type="image/ico" href="img/favicons/favicon.ico" />
        <link rel="icon" type="image/png" href="img/favicons/favicon-16x16.png" />
        <link rel="icon" type="image/png" href="img/favicons/favicon-32x32.png" />
        <link rel="icon" type="image/png" href="img/favicons/favicon-64x64.png" />
        <link rel="icon" type="image/png" href="img/favicons/favicon-96x96.png" />
        <link rel="icon" type="image/png" href="img/favicons/favicon-180x180.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-152x152.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-167x167.png" />
        <link rel="apple-touch-icon" type="image/png" href="img/favicons/apple-touch-icon-180x180.png" />
        <link rel="None" type="image/png" href="img/favicons/mstile-70x70.png" />
        <link rel="None" type="image/png" href="img/favicons/mstile-270x270.png" />
        <link rel="None" type="image/png" href="img/favicons/mstile-310x310.png" />
        <link rel="None" type="image/png" href="img/favicons/mstile-310x150.png" />
        <link rel="shortcut icon" type="image/png" href="img/favicons/favicon-196x196.png" />
        <link rel="icon" type="image/svg+xml" href="{$project_logo}" sizes="any" />
        <link rel="profile" href="http://gmpg.org/xfn/11"></link>
        <title><xsl:value-of select="$html_title"/></title>
        <link href="vendor/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="vendor/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="vendor/tabulator-tables/css/tabulator_bootstrap5.min.css" rel="stylesheet"></link>
        <link href="css/tablutor-style.css" rel="stylesheet"></link>   
        <link rel="stylesheet" href="css/style.css" type="text/css"></link>        
        <script src="vendor/i18next/i18next.min.js"></script>
        <script src="vendor/i18next/jquery-i18next.min.js"></script>
        <script src="vendor/i18next/i18nextBrowserLanguageDetector.min.js"></script>
        <script src="vendor/i18next/i18nextHttpBackend.min.js"></script>
        <script type="text/javascript">
            var _paq = _paq || [];
            _paq.push(['trackPageView']);
            _paq.push(['enableLinkTracking']);
            (function () {
              var u = "https://matomo.acdh.oeaw.ac.at/";
              _paq.push(['setTrackerUrl', u + 'piwik.php']);
              _paq.push(['setSiteId', '226']);
              var d = document, g = d.createElement('script'), s = d.getElementsByTagName('script')[0];
              g.type = 'text/javascript'; g.async = true; g.defer = true; g.src = u + 'piwik.js'; s.parentNode.insertBefore(g, s);
            })();
        </script>
    </xsl:template>
</xsl:stylesheet>
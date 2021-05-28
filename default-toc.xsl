<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://wkhtmltopdf.org/outline"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitiona
l.dtd"
                indent="yes" />
    <xsl:template match="outline:outline">
        <html>
            <head>
                <title>目录</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <style>
                body {
  padding: 2rem;
  font-family: Microsoft YaHei, sans-serif !important;
}
.title {
  font-size: 30px;
  text-align: center;
}
    .link {
      display: -webkit-box;
display: -webkit-flex;
-webkit-flex-wrap: nowrap;

      display: flex;
      width: 100%;
      align-items: center;
      flex-wrap: nowrap;
    }
    .dash {
      flex-grow: 2;
      -webkit-flex-grow: 2;
      height: 1px;
      margin: 0 5px;
      border-bottom: 2px dotted #ccc;
    }
li {
  list-style: none;
  line-height: 1.5;
}
ul {
  font-size: 24px;
}
ul ul {
  font-size: 80%;
}
ul {
  padding-left: 0em;
}
ul ul {
  padding-left: 1em;
}
a {
  text-decoration: none;
  color: black;
}

                </style>
            </head>
            <body>
                <p class="title">TOC Sheet File Online</p>
                <ul><xsl:apply-templates select="outline:item/outline:item"/></ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="outline:item">
        <li>
            <xsl:if test="@title!=''">
                <div class="link">
                    <a>
                        <xsl:if test="@link">
                            <xsl:attribute name="href"><xsl:value-of select="@link"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="@backLink">
                            <xsl:attribute name="name"><xsl:value-of select="@backLink"/></xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="@title" />
                    </a>
                    <div class="dash"> </div>
                    <span> <xsl:value-of select="@page" /> </span>
                </div>
            </xsl:if>
            <ul>
                <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
                <xsl:apply-templates select="outline:item"/>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>
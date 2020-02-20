<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  exclude-result-prefixes="atom"
>
  <xsl:template match="/">
    <html>
      <head>
	<link rel="stylesheet" href="style.css" />
	
      </head>
      <body>


          <xsl:apply-templates select="atom:feed/atom:entry[atom:category/@term='http://schemas.google.com/blogger/2008/kind#post']">
	    <xsl:sort select="position()" data-type="number" order="descending"/>
	  </xsl:apply-templates>

      </body>
    </html>
  </xsl:template>

  <xsl:template match="atom:entry[atom:category/@term='http://schemas.google.com/blogger/2008/kind#post']">
      <h1><xsl:value-of select="atom:title"/></h1>      
      <h2><xsl:value-of select="atom:author/atom:name"/></h2>
	 <h3><xsl:value-of select="substring(atom:published,0,11)" /></h3>
<xsl:value-of select="atom:content"  disable-output-escaping="yes" />
  </xsl:template>
</xsl:stylesheet>

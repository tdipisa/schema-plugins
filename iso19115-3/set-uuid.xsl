<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:gco="http://www.isotc211.org/2005/gco"
  xmlns:mdb="http://www.isotc211.org/2005/mdb/1.0/2013-06-24" 
  xmlns:mcc="http://www.isotc211.org/2005/mcc/1.0/2013-06-24"
  exclude-result-prefixes="#all">
  
  <xsl:template match="/root">
    <xsl:apply-templates select="*[name() != 'env']"/>
  </xsl:template>
  
  <xsl:template match="mdb:MD_Metadata|*[@gco:isoType='mdb:MD_Metadata']">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <mdb:metadataIdentifier>
        <mcc:MD_Identifier>
          <!-- citation could be for this GeoNetwork node ?
            <mcc:citation><cit:CI_Citation>etc</cit:CI_Citation></mcc:citation>
          -->
          <mcc:codeSpace>
            <gco:CharacterString>urn:uuid</gco:CharacterString>
          </mcc:codeSpace>
          <mcc:code>
            <gco:CharacterString><xsl:value-of select="/root/env/uuid"/></gco:CharacterString>
          </mcc:code>
        </mcc:MD_Identifier>
      </mdb:metadataIdentifier>
      <xsl:apply-templates select="node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="mdb:metadataIdentifier"/>
  
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>

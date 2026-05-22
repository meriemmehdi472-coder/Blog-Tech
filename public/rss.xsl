<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html lang="fr">
<head>
<meta charset="utf-8"/>
<title>RSS - Meriem Mehdi</title>

<style>
body {
  margin: 0;
  padding: 50px 20px;
  font-family: system-ui, sans-serif;
  background: #0f172a;
  color: white;
}

.container {
  max-width: 900px;
  margin: auto;
}

h1 {
  font-size: 3rem;
  margin-bottom: .5rem;
}

.subtitle {
  color: #94a3b8;
  margin-bottom: 2rem;
}

.card {
  background: #111827;
  border: 1px solid #1e293b;
  border-radius: 20px;
  padding: 1.5rem;
  margin-bottom: 1rem;
  transition: .25s ease;
}

.card:hover {
  transform: translateY(-3px);
  border-color: #8b5cf6;
}

a {
  color: #a78bfa;
  text-decoration: none;
  font-size: 1.2rem;
  font-weight: bold;
}

.description {
  color: #cbd5e1;
  margin-top: .8rem;
}

.date {
  color: #64748b;
  margin-top: .7rem;
  font-size: .9rem;
}
</style>
</head>

<body>
<div class="container">

<h1>📡 Blog RSS</h1>

<p class="subtitle">
Suivez mes nouveaux articles sur le développement web, Astro, Rails et l’IA.
</p>

<xsl:for-each select="rss/channel/item">
  <div class="card">

    <a href="{link}">
      <xsl:value-of select="title"/>
    </a>

    <div class="description">
      <xsl:value-of select="description"/>
    </div>

    <div class="date">
      <xsl:value-of select="pubDate"/>
    </div>

  </div>
</xsl:for-each>

</div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
import { getCollection } from 'astro:content';

export async function GET(context) {
  const posts = await getCollection('blog');

  const items = posts.map((post) => `
    <item>
      <title><![CDATA[${post.data.title}]]></title>
      <link>${new URL(`${import.meta.env.BASE_URL}blog/${post.id}/`, context.site)}</link>
      <description><![CDATA[${post.data.description || ''}]]></description>
      <pubDate>${new Date(post.data.pubDate).toUTCString()}</pubDate>
    </item>
  `).join('');

  const rss = `<?xml version="1.0" encoding="UTF-8"?>
  <?xml-stylesheet type="text/xsl" href="/Blog-Tech/rss.xsl"?>

<rss version="2.0">
  <channel>
    <title>Meriem Mehdi Blog</title>
    <link>${context.site}</link>
    <description>Blog développement web, Astro, IA et apprentissage</description>
    ${items}
  </channel>
</rss>`;

  return new Response(rss, {
    headers: {
      'Content-Type': 'application/xml',
    },
  });
}
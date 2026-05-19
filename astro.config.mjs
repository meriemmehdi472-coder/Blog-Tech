import { defineConfig } from 'astro/config';

const isProd = process.env.NODE_ENV === 'production';

export default defineConfig({
  site: 'https://meriemmehdi472-coder.github.io',
  base: isProd ? '/Blog-Tech' : '/',
});
import { defineConfig } from 'astro/config'
import UnoCSS from 'unocss/astro'
import Icons from 'unplugin-icons/vite'
import vue from '@astrojs/vue'

export default defineConfig({
  integrations: [vue(), UnoCSS()],
  vite: {
    plugins: [
      Icons({
        compiler: 'vue3',
      }),
    ],
    ssr: {
      noExternal: ['@fontsource-variable/inter'],
    },
  },
})

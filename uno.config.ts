import { defineConfig } from 'unocss'
import presetWind4 from '@unocss/preset-wind4'
import transformerDirectives from '@unocss/transformer-directives'

export default defineConfig({
  presets: [presetWind4()],
  transformers: [
    transformerDirectives(),
  ],
})

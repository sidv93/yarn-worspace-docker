const path = require('path')
import { defineConfig } from 'vite'
import reactRefresh from '@vitejs/plugin-react-refresh'

export default defineConfig({
  build: {
    lib: {
      entry: path.resolve(__dirname, 'src/index.js'),
      name: 'lib',
      fileName: (format) => `lib.${format}.js`
    },
    rollupOptions: {
      external: ['react', 'react-dom'],
    }
  },
  plugins: [reactRefresh()]
})

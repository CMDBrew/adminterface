import resolve from 'rollup-plugin-node-resolve'
import commonjs from 'rollup-plugin-commonjs'
import babel from 'rollup-plugin-babel'
import { uglify } from 'rollup-plugin-uglify'
import { stripIndent } from 'common-tags'

const uglifyOptions = {
  mangle: false,
  compress: false,
  output: {
    beautify: true,
    indent_level: 2,
    preamble: stripIndent`
      /* eslint-disable */
      /**
       * Warning: This file is auto-generated, do not modify. Instead, make your changes in 'app/javascript/active_admin_bootstrap/' and run \`yarn build\`
       */
      //= require aab-bootstrap
    ` + '\n'
  }
}

export default {
  input: 'app/javascript/active_admin_bootstrap/base.js',
  output: {
    file: 'app/assets/javascripts/active_admin_bootstrap/base.js',
    format: 'umd',
    name: 'ActiveAdminBootstrap'
  },
  plugins: [
    resolve(),
    commonjs(),
    babel(),
    uglify(uglifyOptions)
  ],
  // Use client's yarn dependencies instead of bundling everything
  external: [
    'aab-bootstrap',
    'bootstrap-icons'
  ]
}

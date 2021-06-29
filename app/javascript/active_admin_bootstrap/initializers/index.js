const initializers = require.context('.', true, /\.js$/)
initializers.keys().forEach(initializers)

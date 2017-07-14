var rollup = require('rollup');
var coffee = require('rollup-plugin-coffee-script');
var nodeResolve = require('rollup-plugin-node-resolve');
var commonjs = require('rollup-plugin-commonjs');
var deasync = require('deasync');

module.exports = {
  entry: 'src/index.coffee',
  plugins: [
    coffee({exclude: 'node_modules/**'}),
    nodeResolve({extensions: ['.js', '.coffee']}),
    commonjs({extensions: ['.js', '.coffee']})
  ],

  targets: [
    {format: 'es', dest: 'dist/solaris-model.mjs'},
    {format: 'umd', moduleName: 'SolarSystem', dest: 'dist/solaris-model.js'}
  ]
};

if (process.argv.join().match(/\/node_modules\/mocha\/bin\//)) {
  process.env.PUBLICIZER_EXPOSE = 'true';

  var compileMochaTest = deasync(function (filename, cb) {
    rollup.rollup({entry: filename, plugins: module.exports.plugins}).then(function (bundle) {
      cb(null, bundle.generate({format: 'iife', moduleName: filename}).code);
    });
  });

  require.extensions['.coffee'] = function(module, filename) {
    return module._compile(compileMochaTest(filename), filename);
  };
}
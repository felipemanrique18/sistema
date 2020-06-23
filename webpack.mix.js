const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */


mix.styles([
    'resources/assets/css/bootstrap.min.css',
    'resources/assets/css/metisMenu.min.css',
    'resources/assets/css/style.css',
], 'public/css/plantilla.css');



mix.scripts([
    'resources/assets/js/jquery-2.1.4.min.js',
    'resources/assets/js/bootstrap.min.js',
    'resources/assets/js/metisMenu.min.js',
    'resources/assets/js/jquery.slimscroll.min.js',

], 'public/js/plantilla.js');

mix.styles([
    'resources/assets/plugins/datatables/jquery.dataTables.min.css',
    'resources/assets/plugins/datatables/buttons.bootstrap.min.css',
    'resources/assets/plugins/datatables/responsive.bootstrap.min.css',
    'resources/assets/plugins/datatables/scroller.bootstrap.min.css',
    'resources/assets/plugins/datatables/dataTables.colVis.css',
    'resources/assets/plugins/datatables/dataTables.bootstrap.min.css',
    'resources/assets/plugins/datatables/fixedColumns.dataTables.min.css',
    ], 'public/css/plugins_datables.css');

mix.scripts([
    'resources/assets/plugins/datatables/jquery.dataTables.min.js',
    'resources/assets/plugins/datatables/dataTables.bootstrap.js',
    'resources/assets/plugins/datatables/dataTables.buttons.min.js',
    'resources/assets/plugins/datatables/buttons.bootstrap.min.js',
    'resources/assets/plugins/datatables/jszip.min.js',
    'resources/assets/plugins/datatables/vfs_fonts.js',
    'resources/assets/plugins/datatables/buttons.html5.min.js',
    'resources/assets/plugins/datatables/buttons.print.min.js',
    'resources/assets/plugins/datatables/dataTables.keyTable.min.js',
    'resources/assets/plugins/datatables/dataTables.responsive.min.js',
    'resources/assets/plugins/datatables/responsive.bootstrap.min.js',
    'resources/assets/plugins/datatables/dataTables.scroller.min.js',
    'resources/assets/plugins/datatables/dataTables.colVis.js',
    'resources/assets/plugins/datatables/dataTables.fixedColumns.min.js',
], 'public/js/plugins_datables.js');






mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css');
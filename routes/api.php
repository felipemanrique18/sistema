<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
// Route::get('categorias','CategoriaController@index');

// Route::middleware('auth:api')->get('/home', function (Request $request) {
//     return 'hola';
// });

Route::group(['middleware' => 'auth'], function() {
    Route::get('/dashboard', 'DashboardController');
    Route::get('/categoria', 'CategoriaController@index');
    Route::post('/categoria/registrar', 'CategoriaController@store');
    Route::put('/categoria/actualizar', 'CategoriaController@update');
    Route::put('/categoria/desactivar', 'CategoriaController@destroy');
    Route::put('/categoria/activar', 'CategoriaController@activar');
    Route::get('/categoria/selectCategoria', 'CategoriaController@selectCategoria');

    Route::get('/articulo', 'ArticuloController@index');
    Route::get('/articulo/buscarArticulo', 'ArticuloController@buscararticulo');
    Route::get('/articulo/listarArticulo', 'ArticuloController@listarArticulo');
    Route::post('/articulo/registrar', 'ArticuloController@store');
    Route::put('/articulo/actualizar', 'ArticuloController@update');
    Route::put('/articulo/desactivar', 'ArticuloController@destroy');
    Route::put('/articulo/activar', 'ArticuloController@activar');
    

    Route::get('/cliente', 'ClienteController@index');
    Route::get('/cliente/selectCliente', 'ClienteController@selectCliente');
    Route::post('/cliente/registrar', 'ClienteController@store');
    Route::put('/cliente/actualizar', 'ClienteController@update');

    Route::get('/proveedor', 'ProveedorController@index');
    Route::get('/proveedor/selectProveedor', 'ProveedorController@selectProveedor');
    Route::post('/proveedor/registrar', 'ProveedorController@store');
    Route::put('/proveedor/actualizar', 'ProveedorController@update');

    Route::get('/roles', 'RolController@index');

    Route::get('/user', 'UserController@index');
    Route::get('/user/show', 'UserController@show');
    Route::post('/user/registrar', 'UserController@store');
    Route::put('/user/actualizar', 'UserController@update');
    Route::put('/user/desactivar', 'UserController@destroy');
    Route::put('/user/activar', 'UserController@activar');
    Route::put('/user/actualizarP', 'UserController@cambiarPassword');

    Route::get('/ingreso', 'IngresoController@index');
    Route::post('/ingreso/registrar', 'IngresoController@store');
    Route::put('/ingreso/desactivar', 'IngresoController@destroy');


    Route::get('/venta', 'VentaController@index');
    Route::post('/venta/registrar', 'VentaController@store');
    Route::put('/venta/desactivar', 'VentaController@destroy');
    

    Route::post('/notification/get', 'NotificationController@get')->middleware('auth');
    Route::post('/notification/leidas', 'NotificationController@MarcarLeida')->middleware('auth');
});


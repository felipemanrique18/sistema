<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('contenido.contenido');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('categoria', 'CategoriaController@index');
Route::post('categoria/registrar', 'CategoriaController@store');
Route::put('categoria/actualizar', 'CategoriaController@update');
Route::put('categoria/desactivar', 'CategoriaController@destroy');
Route::put('categoria/activar', 'CategoriaController@activar');
Route::get('categoria/selectCategoria', 'CategoriaController@selectCategoria');

Route::get('articulo', 'ArticuloController@index');
Route::post('articulo/registrar', 'ArticuloController@store');
Route::put('articulo/actualizar', 'ArticuloController@update');
Route::put('articulo/desactivar', 'ArticuloController@destroy');
Route::put('articulo/activar', 'ArticuloController@activar');
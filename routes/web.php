<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
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


// DB::listen(function ($query)
// {
// 	echo "<pre>".$query->sql."</pre>";
// });

Route::get('/dashboard', 'InicioController')->name('inicio');
Route::get('/dashboard/{any}', 'InicioController')->name('dashboard')->where('any','.*');




// Route::get('dashboard', 'DashboardController');

// Route::get("/",function(){
// 	$persona = App\Persona::create([
// 		'nombre'=>'Celso Manrique',
// 	]);
// 	$user=App\User::create([
// 		'persona_id'=>$persona->id,
// 		'rol_id'=>'1',
// 		'usuario'=>'celsomanrique',
// 		'password'=>bcrypt('celso1234'),
// 		'condicion_user'=>'1'
// 	]);
// });

Route::get("/eliminarventas",function(){
	$user=App\DetalleVenta::truncate();
	$user=DB::table('ventas')->delete();
});

Route::get('/', 'Auth\LoginController@showLoginForm')->name('/');
Route::post('login', 'Auth\LoginController@login')->name('login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');
Route::get('/home', 'HomeController@index')->name('home');



Route::get('/venta/pdf/{id}', 'VentaController@pdf');
Route::get('/articulo/listarPdf', 'ArticuloController@listarPdf');


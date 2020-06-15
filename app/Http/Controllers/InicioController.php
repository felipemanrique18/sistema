<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\User;

class InicioController extends Controller
{
	function __construct()
    {
        
        $this->middleware('auth');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
    }
	public function __invoke(Request $request)
    {
    	$id=auth()->user()->id;
    	$user=User::with(['persona','rol'])->findOrFail($id);
   		return view('contenido.contenido',compact('user'));
   	}
}

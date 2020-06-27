<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rol;

class RolController extends Controller
{
    function __construct()
    {
        
        $this->middleware('auth');
        $this->middleware('requestsVerify');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
    }
    public function index(Request $request)
    {
        
        $buscar=$request->buscar;

        if ($buscar==''){
            $roles = Rol::orderBy('id','DESC')->paginate(6);
        }else{
            $roles = Rol::where('nombre','like','%'.$buscar.'%')->orderBy('id','DESC')->paginate(6);
        }
        
        

        return [
            'pagination' =>[
                'total' => $roles->total(),
                'current_page' => $roles->currentPage(),
                'per_page' => $roles->perPage(),
                'last_page' => $roles->lastPage(),
                'from' => $roles->firstItem(),
                'to' => $roles->lastItem(),
            ],
            'roles' => $roles
        ];
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Proveedor;
use App\Persona;

class ProveedorController extends Controller
{
    function __construct()
    {
        
        $this->middleware('auth');
        $this->middleware('requestsVerify');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
    }
    public function index(Request $request)
    {
        $tipo=$request->tipo_busqueda;
        $buscar=$request->buscar;

        if ($buscar==''){
            $personas = Proveedor::join('personas','proveedores.persona_id','=','personas.id')
            	->orderBy('persona_id','DESC')
            	->paginate(6);
        }else{
            $personas = Proveedor::join('personas','proveedores.persona_id','=','personas.id')        
                    ->where('personas.'.$tipo, 'like', '%'. $buscar . '%')
                    ->orderBy('persona_id', 'desc')->paginate(6);
        }
        
        

        return [
            'pagination' =>[
                'total' => $personas->total(),
                'current_page' => $personas->currentPage(),
                'per_page' => $personas->perPage(),
                'last_page' => $personas->lastPage(),
                'from' => $personas->firstItem(),
                'to' => $personas->lastItem(),
            ],
            'personas' => $personas
        ];
    }

  
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nombre' => 'required|unique:personas',
        ]);
        $persona=Persona::create($request->all());

        $persona->proveedor()->create([
            'persona_id'=>$persona->id,
            'contacto'=>$request->contacto,
            'telefono_contacto'=>$request->telefono_contacto
        ]);
        return;
    }
       
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {   
        $validated = $request->validate([
            'nombre' => 'required|unique:personas',
        ]);
        $persona=Persona::findOrFail($request->id);
        $persona->update($request->all());
        $persona->proveedor()->update([
            'contacto'=>$request->contacto,
            'telefono_contacto'=>$request->telefono_contacto
        ]);
        return;
    }

    public function selectProveedor(Request $request)
    {
        $filtro =$request->filtro;
        $proveedores = Proveedor::join('personas','proveedores.persona_id','=','personas.id')        
                    ->where('personas.nombre','like', '%'. $filtro. '%')
                    ->select('proveedores.id AS id','personas.nombre','personas.num_documento')
                    ->orderBy('personas.nombre', 'ASC')
                    ->get();

        return ['proveedores'=>$proveedores];
    }
}

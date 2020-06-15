<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Persona;

class ClienteController extends Controller
{
    function __construct()
    {
        
        $this->middleware('auth');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
    }
    public function index(Request $request)
    {
        $tipo=$request->tipo_busqueda;
        $buscar=$request->buscar;

        if ($buscar==''){
            $personas = Persona::orderBy('id','DESC')->paginate(6);
        }else{
            $personas = Persona::where($tipo,'like','%'.$buscar.'%')->orderBy('id','DESC')->paginate(6);
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
        $persona = new Persona();
        $persona->nombre = $request->nombre;
        $persona->tipo_documento = $request->tipo_documento;
        $persona->num_documento = $request->num_documento;
        $persona->direccion = $request->direccion;
        $persona->telefono = $request->telefono;
        $persona->email = $request->email;
        $persona->save();
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
    	
        $persona= Persona::findOrFail($request->id);
        $persona->nombre = $request->nombre;
        $persona->tipo_documento = $request->tipo_documento;
        $persona->num_documento = $request->num_documento;
        $persona->direccion = $request->direccion;
        $persona->telefono = $request->telefono;
        $persona->email = $request->email;
        $persona->save();
    }

     public function selectCliente(Request $request)
    {
        $filtro =$request->filtro;
        $clientes= Persona::where('personas.nombre','like', '%'. $filtro. '%')
                    ->select('id','personas.nombre','personas.num_documento')
                    ->orderBy('personas.nombre', 'ASC')
                    ->get();

        return ['clientes'=>$clientes];
    }
}

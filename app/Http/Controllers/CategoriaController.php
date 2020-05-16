<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Categoria;


class CategoriaController extends Controller
{
    /**!
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $buscar=$request->buscar;

        if ($buscar==''){
            $categorias = Categoria::orderBy('id','DESC')->paginate(6);
        }else{
            $categorias = Categoria::where('nombre','like','%'.$buscar.'%')->orderBy('id','DESC')->paginate(6);
        }
        
        

        return [
            'pagination' =>[
                'total' => $categorias->total(),
                'current_page' => $categorias->currentPage(),
                'per_page' => $categorias->perPage(),
                'last_page' => $categorias->lastPage(),
                'from' => $categorias->firstItem(),
                'to' => $categorias->lastItem(),
            ],
            'categorias' => $categorias
        ];
    }

    public function selectCategoria(Request $request){
        $categorias=Categoria::select('id','nombre')->get();
        return ['categorias' => $categorias];
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $categoria = new Categoria;
        $categoria->nombre = $request->nombre;
        $categoria->descripcion = $request->descripcion;
        $categoria->save();
        // $categoria = Categoria::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
    	
        $categoria = Categoria::findOrFail($request->id);
        $categoria->nombre = $request->nombre;
        $categoria->descripcion = $request->descripcion;
        $categoria->save();


        // $categoria = Categoria::findOrFail($id)->update();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $categoria =Categoria::findOrFail($request->id);
        $categoria->condicion = '0';
        $categoria->save();;
    }

    public function activar(Request $request)
    {
        $categoria =Categoria::findOrFail($request->id);
        $categoria->condicion = '1';
        $categoria->save();
    }
}

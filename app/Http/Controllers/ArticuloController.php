<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Articulo;

class ArticuloController extends Controller
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
            $articulos = Articulo::with(['categoria'])->orderBy('id','DESC')->paginate(6);
        }else{
            $articulos = Articulo::with(['categoria'])->where('nombre','like','%'.$buscar.'%')->orderBy('id','DESC')->paginate(6);
        }
        
        

        return [
            'pagination' =>[
                'total' => $articulos->total(),
                'current_page' => $articulos->currentPage(),
                'per_page' => $articulos->perPage(),
                'last_page' => $articulos->lastPage(),
                'from' => $articulos->firstItem(),
                'to' => $articulos->lastItem(),
            ],
            'articulos' => $articulos
        ];
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
        $articulo = new Articulo;
        $articulo->idcategoria=$request->idcategoria;
        $articulo->codigo=$request->codigo;
        $articulo->nombre = $request->nombre;
        $articulo->precio_venta=$request->precio_venta;
        $articulo->stock=$request->stock;
        $articulo->descripcion = $request->descripcion;
        $articulo->save();
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
    	
        $articulo = Articulo::findOrFail($request->id);
        $articulo->idcategoria=$request->idcategoria;
        $articulo->codigo=$request->codigo;
        $articulo->nombre = $request->nombre;
        $articulo->precio_venta=$request->precio_venta;
        $articulo->stock=$request->stock;
        $articulo->descripcion = $request->descripcion;
        $articulo->save();


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
        $articulo= Articulo::findOrFail($request->id);
        $articulo->condicion ="0";
        $articulo->save();
    }

    public function activar(Request $request)
    {
        $articulo= Articulo::findOrFail($request->id);
        $articulo->condicion ="2";
        $articulo->save();
    }
}

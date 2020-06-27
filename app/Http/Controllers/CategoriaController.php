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
    function __construct()
    {
        
        $this->middleware('auth');
        $this->middleware('roles:1,2,3');
        $this->middleware('requestsVerify');
    }
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
        $categorias=Categoria::select('id','nombre')->where('condicion','1')->get();
        return ['categorias' => $categorias];
    }

    public function store(Request $request)
    {
        Categoria::Create($request->all());
        return ;
    }

    public function update(Request $request)
    {
        Categoria::findOrFail($request->id)->update($request->all());
        return;
    }

    public function destroy(Request $request)
    {
        Categoria::findOrFail($request->id)->update([
            'condicion' => '0'
        ]);
    }

    public function activar(Request $request)
    {
        Categoria::findOrFail($request->id)->update([
            'condicion' => '1'
        ]);
    }
}

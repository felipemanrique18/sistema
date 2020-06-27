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
    function __construct()
    {
        
        $this->middleware('auth');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
        $this->middleware('requestsVerify');
    }
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

    public function listarArticulo(Request $request)
    {
        $buscar=$request->buscar;
        $tipo=$request->tipo;

        if($tipo==''){
            if ($buscar==''){
            $articulos = Articulo::with(['categoria'])->orderBy('id','DESC')->paginate(6);
            }else{
                $articulos = Articulo::with(['categoria'])->where('nombre','like','%'.$buscar.'%')->orderBy('id','DESC')->paginate(6);
            }
        }else{
            if ($buscar==''){
            $articulos = Articulo::with(['categoria'])
            ->where('articulos.stock','>','0')
            ->orderBy('id','DESC')
            ->paginate(6);
            }else{
                $articulos = Articulo::with(['categoria'])
                ->where('nombre','like','%'.$buscar.'%')
                ->where('articulos.stock','>','0')
                ->orderBy('id','DESC')->paginate(6);
            }
        }

        
        
        return ['articulos' => $articulos];
    }

    public function buscarArticulo(Request $request)
    {
        $filtro=$request->filtro;
        $articulos= Articulo::where('codigo','=',$filtro)
        ->select('id','nombre','precio_venta')->orderBy('nombre','ASC')
        ->take(1)->get();

        return['articulos'=>$articulos];
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
        Articulo::Create($request->all());
        return ;
        // $categoria = Categoria::create($request->all());
    }

    public function update(Request $request)
    {
    	
        Articulo::findOrFail($request->id)->update($request->all());
        return;
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
        Articulo::findOrFail($request->id)->update([
            'condicion' => '0'
        ]);
    }

    public function activar(Request $request)
    {
        Articulo::findOrFail($request->id)->update([
            'condicion' => '1'
        ]);
    }

    public function listarPdf()
    {
        $articulos = Articulo::with(['categoria'])->orderBy('nombre','DESC')->get();
        $cont=Articulo::count();

        $pdf = \PDF::loadView('pdf.articulos',['articulos'=>$articulos,'cont'=>$cont]);
        return $pdf->download('articulos.pdf');
        
    }
}

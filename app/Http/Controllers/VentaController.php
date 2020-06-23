<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Venta;
use App\DetalleVenta;
use App\User;
use App\Persona;
use App\Notifications\NotifyAdmin;

class VentaController extends Controller
{
   function __construct()
    {
        
        $this->middleware('auth');
        $this->middleware('roles:1,2');
    }

    public function index(Request $request)
    {
        $tipo=$request->tipo_busqueda;
        $buscar=$request->buscar;

        if ($buscar==''){
            $ventas = Venta::with(['DetalleVenta','DetalleVenta.articulo','cliente','usuario.persona'])
	            ->orderBy('ventas.id', 'desc')
	            ->paginate(10);
        }else{
            $ventas = Venta::with(['DetalleVenta','DetalleVenta.articulo','cliente','usuario.persona'])
	            ->orderBy('ventas.id', 'desc')
	            ->where('ventas.'.$tipo, 'like', '%'. $buscar . '%')
	            ->paginate(10);
        }
        
        

        return [
            'pagination' =>[
                'total' => $ventas->total(),
                'current_page' => $ventas->currentPage(),
                'per_page' => $ventas->perPage(),
                'last_page' => $ventas->lastPage(),
                'from' => $ventas->firstItem(),
                'to' => $ventas->lastItem(),
            ],
            'ventas' => $ventas
        ];
    }
  
    public function store(Request $request)
    {

        $numventas=Venta::count();
    	$mytime=Carbon::now('America/Bogota');
        switch ($numventas) {
            case $numventas<100:
                $serie_comprobante="000".$numventas;
                $num_comprobante='000'.$numventas;
                break;
            case $numventas<1000:
                $serie_comprobante="00".$numventas;
                $num_comprobante='00'.$numventas;
            default:
                $serie_comprobante=$numventas;
                $num_comprobante=$numventas;
                break;
        }
        if ($request->cliente_id==0) {
            $desconocido=Persona::where('nombre','=','desconocido')->get();
            $venta=Venta::create([
                'cliente_id' => $desconocido[0]->id,
                'usuario_id' => \Auth::user()->id,
                'tipo_comprobante' => $request->tipo_comprobante,
                'serie_comprobante' => $serie_comprobante,
                'num_comprobante' => $num_comprobante,
                'fecha_hora' => $mytime->toDateString(),
                'impuesto' => $request->impuesto,
                'total' => $request->total,
                'estado' => 'Registrado'
            ]);

        }else{
            $venta=Venta::create([
                'cliente_id' => $request->cliente_id,
                'usuario_id' => \Auth::user()->id,
                'tipo_comprobante' => $request->tipo_comprobante,
                'serie_comprobante' => $serie_comprobante,
                'num_comprobante' => $num_comprobante,
                'fecha_hora' => $mytime->toDateString(),
                'impuesto' => $request->impuesto,
                'total' => $request->total,
                'estado' => 'Registrado'
            ]);
        }
        
        $detalles = $request->data;//Array de detalles
            //Recorro todos los elementos

        foreach($detalles as $ep=>$det)
        {
             $detalle=DetalleVenta::create([
                'venta_id' => $venta->id,
                'articulo_id' => $det['idarticulo'],
                'cantidad' => $det['cantidad'],
                'precio' => $det['precio'],
                'descuento'=>$det['descuento']

            ]);
        }
        $fechaActual=date('Y-m-d');
        
        $arregloDatos=[
            'mensaje'=>[
                'msj'=>'Venta Registrada'
            ]
        ];

        $allUser =User::all();

        foreach ($allUser as $key => $notificar) {
            if ($notificar->rol_id==1 || $notificar->rol_id==2) {
                User::findOrFail($notificar->id)->notify(new NotifyAdmin($arregloDatos));
            }
            
        }
        return['id'=>$venta->id] ;
    }
       
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy(Request $request)
    {
        Venta::findOrFail($request->id)->update([
            'estado' => 'Anulado'
        ]);
    }

    public function pdf(Request $request,$id)
    {
        $venta = Venta::with(['DetalleVenta','DetalleVenta.articulo','cliente','usuario.persona'])
            ->orderBy('ventas.id', 'desc')
            ->findOrFail($id);
           
        $numventa=$venta->num_comprobante;
        
        
        $pdf = \PDF::loadView('pdf.venta',['venta'=>$venta]);
        return $pdf->download('venta-'.$numventa.'.pdf');
    }

}

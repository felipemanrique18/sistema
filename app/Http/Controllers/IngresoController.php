<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Ingreso;
use Carbon\Carbon;
use App\DetalleIngreso;
use App\Articulo;
use App\User;
use App\Notifications\NotifyAdmin;
use DateTime;
use DateTimeZone;

class IngresoController extends Controller
{
    function __construct()
    {
        
        $this->middleware('auth');
        $this->middleware('roles:1,2,3');
        $this->middleware('requestsVerify');
    }

    public function index(Request $request)
    {

        $tipo=$request->tipo_busqueda;
        $buscar=$request->buscar;

        if ($buscar==''){
            $ingresos = Ingreso::with(['DetalleIngreso','DetalleIngreso.articulo','proveedor','usuario.persona'])
	            ->orderBy('ingresos.id', 'desc')
	            ->paginate(6);
        }else{
            $ingresos = Ingreso::with(['DetalleIngreso','DetalleIngreso.articulo','proveedor','usuario.persona'])
	            ->orderBy('ingresos.id', 'desc')
	            ->where('ingresos.'.$tipo, 'like', '%'. $buscar . '%')
	            ->paginate(6);
        }
        
        

        return [
            'pagination' =>[
                'total' => $ingresos->total(),
                'current_page' => $ingresos->currentPage(),
                'per_page' => $ingresos->perPage(),
                'last_page' => $ingresos->lastPage(),
                'from' => $ingresos->firstItem(),
                'to' => $ingresos->lastItem(),
            ],
            'ingresos' => $ingresos
        ];
        
    }
  
    public function store(Request $request)
    {

    	$numingresos=Ingreso::count();
        $mytime=Carbon::now('America/Bogota');
        
        // Asegúrate de que $numingresos sea un número entero positivo
        $numingresos = max(0, (int)$numingresos);

        // Define la longitud deseada del número
        $longitud = 5;

        // Rellena con ceros a la izquierda según la longitud deseada
        $serie_comprobante = str_pad($numingresos, $longitud, '0', STR_PAD_LEFT);
        $num_comprobante = $serie_comprobante;


        // Establecer la zona horaria de Bogotá
        $zonaHorariaBogota = new DateTimeZone('America/Bogota');

        // Obtener la fecha y hora actual en Bogotá
        $fechaHoraBogota = new DateTime('now', $zonaHorariaBogota);

        $ingreso=Ingreso::create([
        	'proveedor_id' => $request->proveedor_id,
            'usuario_id' => \Auth::user()->id,
            'tipo_comprobante' => $request->tipo_comprobante,
            'serie_comprobante' => $serie_comprobante,
            'num_comprobante' => $num_comprobante,
            'fecha_hora' => $fechaHoraBogota,
            'impuesto' => $request->impuesto,
            'total' => $request->total,
            'estado' => 'Registrado'

        ]);
        $detalles = $request->data;//Array de detalles
            //Recorro todos los elementos

        foreach($detalles as $ep=>$det)
        {
             $detalle=DetalleIngreso::create([
                'ingreso_id' => $ingreso->id,
                'articulo_id' => $det['idarticulo'],
                'cantidad' => $det['cantidad'],
                'precio' => $det['precio']

            ]);

            $articulo = Articulo::find($det['idarticulo']);

            if($articulo){
                $articulo->stock = $articulo->stock + $det['cantidad'];
                $articulo->save();
            }
            
        }
        $fechaActual=date('Y-m-d');
        
        $arregloDatos=[
            'mensaje'=>[
                'msj'=>'Ingreso Registrado'
            ]
        ];

        $allUser =User::all();

        foreach ($allUser as $key => $notificar) {
            User::findOrFail($notificar->id)->notify(new NotifyAdmin($arregloDatos));
        }

        return;
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
        Ingreso::findOrFail($request->id)->update([
            'estado' => 'Anulado'
        ]);
    }

}

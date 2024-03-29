<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
  
    function __construct()
    {
        
        // $this->middleware('auth');
        // $this->middleware('roles:admin',['except' => ['edit','update','show']]);
        $this->middleware('requestsVerify');
    }
    public function __invoke(Request $request)
    {
        date_default_timezone_set('America/Bogota');
        $anio=date('Y');
        $dia=date("d");
        $ingresos=DB::table('ingresos as i')
        ->select(DB::raw('EXTRACT(MONTH FROM i.fecha_hora) as mes'),
        DB::raw('EXTRACT(YEAR FROM i.fecha_hora) as anio'),
        DB::raw('SUM(i.total) as total'))
        ->whereYear('i.fecha_hora',$anio)
        ->where('i.estado','=','Registrado')
        ->groupBy(DB::raw('EXTRACT(MONTH FROM i.fecha_hora)'),DB::raw('EXTRACT(YEAR FROM i.fecha_hora)'))
        ->get();

        $ventas=DB::table('ventas as v')
        ->select(DB::raw('EXTRACT(MONTH FROM v.fecha_hora) as mes'),
        DB::raw('EXTRACT(YEAR FROM v.fecha_hora) as anio'),
        DB::raw('SUM(v.total) as total'))
        ->whereYear('v.fecha_hora',$anio)
        ->where('v.estado','=','Registrado')
        ->groupBy(DB::raw('EXTRACT(MONTH FROM v.fecha_hora)'),DB::raw('EXTRACT(YEAR FROM v.fecha_hora)'))
        ->get();

        $ventasdia=DB::table('ventas as v')
        ->select(DB::raw('EXTRACT(DAY FROM v.fecha_hora) as dia'),
        DB::raw('SUM(v.total) as total_dia'))
        ->whereDate('v.fecha_hora',date('Y-m-d'))
        ->where('v.estado','=','Registrado')
        ->groupBy(DB::raw('EXTRACT(DAY FROM v.fecha_hora)'))
        ->get();

        return ['ingresos'=>$ingresos,'ventas'=>$ventas,'ventas_dia'=>$ventasdia,'anio'=>$anio]; 
  

    }
}

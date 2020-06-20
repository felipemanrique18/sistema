<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
  
    public function __invoke(Request $request)
    {
        $anio=date('Y');
        $ingresos=DB::table('ingresos as i')
        ->select(DB::EXTRACT('MONTH FROM i.fecha_hora as mes'),
        DB::EXTRACT('YEAR FROM i.fecha_hora as anio'),
        DB::raw('SUM(i.total) as total'))
        ->whereYear('i.fecha_hora',$anio)
        ->groupBy(DB::EXTRACT('MONTH FROMi.fecha_hora'),DB::EXTRACT('YEAR FROM i.fecha_hora'))
        ->get();

        $ventas=DB::table('ventas as v')
        ->select(DB::EXTRACT('MONTH FROM v.fecha_hora as mes'),
        DB::EXTRACT('YEAR FROM v.fecha_hora as anio'),
        DB::raw('SUM(v.total) as total'))
        ->whereYear('v.fecha_hora',$anio)
        ->groupBy(DB::EXTRACT('MONTH FROM v.fecha_hora'),DB::EXTRACT('YEAR FROM v.fecha_hora'))
        ->get();

        return ['ingresos'=>$ingresos,'ventas'=>$ventas,'anio'=>$anio];      

    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetalleIngreso extends Model
{
	protected $table='detalle_ingresos';
    protected $fillable =[
    	'ingreso_id',
    	'articulo_id',
    	'cantidad',
    	'precio'
    ];

    public $timestamps=false;

    public function ingreso()
    {
        return $this->belongsTo(Ingreso::class);
    }

    public function articulo()
    {
        return $this->belongsTo(Articulo::class);
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetalleVenta extends Model
{

	protected $table='detalle_ventas';
    protected $fillable=[
    	'venta_id',
    	'articulo_id',
    	'cantidad',
    	'precio',
    	'descuento'
    ];

    public $timestamps=false;

    public function venta()
    {
        return $this->hasOne(Venta::class);
    }

    public function articulo()
    {
        return $this->belongsTo(Articulo::class);
    }
}

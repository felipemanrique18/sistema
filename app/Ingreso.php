<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ingreso extends Model
{
    protected $fillable=[
    	'proveedor_id',
    	'usuario_id',
    	'tipo_comprobante',
    	'serie_comprobante',
    	'num_comprobante',
    	'fecha_hora',
    	'impuesto',
    	'total',
    	'estado'

    ];

    public function usuario()
    {
        return $this->belongsTo(User::class);
    }

    public function proveedor()
    {
        return $this->belongsTo(Proveedor::class);
    }

    public function detalleIngreso()
    {
        return $this->hasMany(DetalleIngreso::class);
    }



}

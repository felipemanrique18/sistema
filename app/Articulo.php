<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Articulo extends Model
{

    protected $fullable=[
    	'idcategoria','codigo','nombre','precio_venta','stock','descripcion','condicion'
    ];

    public function categoria()
    {
        return $this->belongsTo(Categoria::class);
    }
}

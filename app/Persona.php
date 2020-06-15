<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    protected $fillable=['nombre','tipo_documento','num_documento','direccion','telefono','email'];

    public function proveedor()
    {
        return $this->hasOne(Proveedor::class);
    }

    public function user()
    {
        return $this->hasOne(User::class);
    }

    public function cliente()
    {
        return $this->hasOne(Persona::class);
    }
}

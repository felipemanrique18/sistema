<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Persona;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        //creamos una persona con el rol de administrado

        $persona= Persona::insert([
            'nombre'=>'Administrador'
        ]);

        User::insert([
            'persona_id'=>7,
            'rol_id'=>1,
            'usuario'=>'Admin',
            'password'=>Hash::make('12345'),
            'condicion_user'=>1
        ]);
    }
}

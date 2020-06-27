<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Persona;
use App\Notifications\NotifyAdmin;
use App\Http\Requests\CreateUserRequest;
use Illuminate\Validation\Rule;
// use App\Http\Requests\UpdateUserRequest;
use Auth;

class UserController extends Controller
{
    function __construct()
    {
        
        $this->middleware('auth');
        $this->middleware('roles:1')->except('show');
        $this->middleware('requestsVerify');
    }
    public function index(Request $request)
    {
        $tipo=$request->tipo_busqueda;
        $buscar=$request->buscar;

        if ($buscar==''){
            $personas = Persona::has('user.rol')
                ->with('user.rol')
                ->orderBy('id','DESC')
                ->paginate(6);
        }else{
            // $authors = Author::with(['books' => function($query) use ($month) {
            //   $query->whereMonth('created_at', $month);
            // }])->get();

            $personas = Persona::has('user.rol')
                ->with('user.rol')
                ->where('personas.'.$tipo,'like', '%'. $buscar . '%')
                ->orderBy('id','DESC')
                ->paginate(6);

            // $personas = User::with(['persona','rol'])
            //     ->where('personas.nombre','like', '%'. $buscar . '%')
            //     ->orderBy('id','DESC')
            //     ->paginate(6);
        }
        
        

        return [
            'pagination' =>[
                'total' => $personas->total(),
                'current_page' => $personas->currentPage(),
                'per_page' => $personas->perPage(),
                'last_page' => $personas->lastPage(),
                'from' => $personas->firstItem(),
                'to' => $personas->lastItem(),
            ],
            'personas' => $personas
        ];
    }

    public function show(Request $request)
    {
        $id=auth()->user()->id;
        $user=User::with(['persona','rol'])->findOrFail($id);
        return ['user'=>$user];
    }

    public function store(CreateUserRequest $request)
    {
        $persona=Persona::create($request->all());

         $persona->user()->create([
            'persona_id'=>$persona->id,
            'rol_id'=>$request->rol_id,
            'usuario'=>$request->usuario,
            'password'=>bcrypt($request->password),
            'condicion_user'=>'1'
        ]);
        $fechaActual=date('Y-m-d');
        
        $arregloDatos=[
            'mensaje'=>[
                'msj'=>'Nuevo Usuario Registrado',
                'tipo'=>1
            ]
        ];

        $allUser =User::where('rol_id','=','1')->get();

        foreach ($allUser as $key => $notificar) {
            User::findOrFail($notificar->id)->notify(new NotifyAdmin($arregloDatos));
        }
        
    }
       
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {   	
        $usuario_id=$request->user_id;
        
        $request->validate([
            'usuario' => "required|unique:users,usuario,$usuario_id,id"
        ]);
        $persona=Persona::findOrFail($request->id);
        $persona->update($request->all());
        $persona->user()->update([
            'rol_id'=>$request->rol_id,
            'usuario'=>$request->usuario
        ]);

        $arregloDatos=[
            'mensaje'=>[
                'msj'=>'Se actulizo sus datos',
                'tipo'=>3
            ]
        ];
        $user=User::where('persona_id',$request->id)->get();
        User::findOrFail($user[0]->id)->notify(new NotifyAdmin($arregloDatos));
        
        return;
        
        

    }

    public function destroy(Request $request)
    {
        User::where('persona_id','=',$request->id)->update([
            'condicion_user' => '0'
        ]);
    }

    public function activar(Request $request)
    {
        User::where('persona_id','=',$request->id)->update([
            'condicion_user' => '1'
        ]);

        $arregloDatos=[
            'mensaje'=>[
                'msj'=>'Se activo su usuario',
                'tipo'=>4
            ]
        ];
        $user=User::where('persona_id',$request->id)->get();
        User::findOrFail($user[0]->id)->notify(new NotifyAdmin($arregloDatos));
    }

    public function cambiarPassword(Request $request)
    {

        $request->validate([
            'password' => "required|min:8|string"
        ]);
        User::where('persona_id','=',$request->id)->update([
            'password'=>bcrypt($request->password)
        ]);

        $arregloDatos=[
            'mensaje'=>[
                'msj'=>'Se actulizo su contraseña',
                'tipo'=>2
            ]
        ];
        $user=User::where('persona_id',$request->id)->get();
        User::findOrFail($user[0]->id)->notify(new NotifyAdmin($arregloDatos));
    }
}

<template>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="m-b-20">
                <div class="form-group container-titulo">
                    <h2>
                        <b><i class="fas fa-users"></i> Usuarios</b>
                        <button class="btn btn-success pull-right" type="button" @click="abrirModal('persona','registrar')">
                        <i class="fa fa-plus"></i> Nuevo
                        </button>
                    </h2>
                </div>
                
                <!-- <p class="text-muted font-13 m-b-30">
                    The Buttons extension for DataTables provides a common set of options, API methods and
                    styling to display buttons on a page that will interact with a DataTable. The core
                    library provides the based framework upon which plug-ins can built.
                </p> -->
                <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                    <div class="dataTables_filter">
                        <label>
                            <select v-model="tipo_busqueda" class="form-control input-sm">
                                <option value="nombre">Nombre</option>
                                <option value="num_documento">Documento</option>
                                <option value="email">Email</option>
                            </Select>
                            <input type="search" v-model="buscar" v-on:keypress="listarPersona(1,tipo_busqueda,buscar)" v-on:blur="listarPersona(1,tipo_busqueda,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                            <button type="submit" @click="listarPersona(1,tipo_busqueda,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                        </label>
                    </div>
                    <div class="table-responsive">
                        
                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Documento</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Email</th>
                                <th>Usuario</th>
                                <th>Rol</th>
                                <th>Accion</th>
                                
                            </tr>
                            </thead>


                            <tbody>
                            <tr v-for="persona in arrayPersona" :key="persona_id">
                                <td v-text="persona.nombre"></td>
                                <td v-if="persona.tipo_documento && persona.num_documento">{{ persona.tipo_documento }}.{{ persona.num_documento }}</td>
                                <td v-else></td>
                                <td v-text="persona.direccion"></td>
                                <td v-text="persona.telefono"></td>
                                <td v-text="persona.email"></td>
                                <td v-text="persona.user.usuario"></td>
                                <td v-text="persona.user.rol.nombre_rol"></td>
                                <td>       
                                    <template v-if="persona.user.condicion_user">
                                        <button type="button" class="btn btn-sm btn-primary" @click="abrirModal('persona','actualizar',persona)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fa fa-edit"></i></button>

                                        <button type="button" class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Desactivar" @click="desactivarUsuario(persona.id)" ><i class="fa fa-trash-alt"></i></button>
                                    </template>

                                    <template v-else>
                                        <button type="button" class="btn btn-sm btn-success"  data-toggle="tooltip" data-placement="top" title="" data-original-title="Activar" @click="activarUsuario(persona.id)"><i class="fa fa-check"></i></button>
                                    </template>
                                    
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="dataTables_info" id="datatable_info" role="status" aria-live="polite" _msthash="255762" _msttexthash="657423" v-text="num_entradas"></div>
                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_simple_numbers" >
                                <ul class="pagination">
                                    <li v-if="pagination.current_page >1">
                                        <a href="" @click.prevent="cambiarPagina(pagination.current_page-1,buscar,tipo_busqueda)"><i class="fa fa-angle-left"></i></a>
                                    </li>
                                    <li :class="[page == isActived ? 'active' : '']" v-for="page in pagesNumber" :key="page">
                                        <a href="" @click.prevent="cambiarPagina(page,buscar,tipo_busqueda)" v-text="page"></a>
                                    </li>
                                    <li v-if="pagination.current_page < pagination.last_page">
                                        <a href="" @click.prevent="cambiarPagina(pagination.current_page+1,buscar,tipo_busqueda)"><i class="fa fa-angle-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
    <div id="myModal" class="modal fade in" :class="{'mostrar' : modal}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" @click="cerrarModal()" aria-hidden="true">×</button>
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                </div>
                <div class="modal-body">
                   <form action="" method="post" enctype="multipart/form-data">
                        <div v-if="tipoAccion==1 || tipoAccion==2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group" :class="errorMostrarMsjPersona[0].nombre?'has-error':''">
                                        <label class="control-label">Nombre (*)</label>
                                        <input type="text" v-model="nombre" class="form-control" placeholder="Nombre de cliente">
                                        <div v-show="errorMostrarMsjPersona[0].nombre" class="div-error">
                                            <div class="text-error">
                                                {{ errorMostrarMsjPersona[0].nombre }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group" :class="errorMostrarMsjPersona[0].rol?'has-error':''">
                                        <label for="field-1" class="control-label">Rol (*)</label>
                                        <select v-model="rol" class="form-control">
                                            <option value="0" disabled>Seleccione...</option>
                                            <option value="Administrador">Administrador</option>
                                            <option value="Vendedor">Vendedor</option>
                                            <option value="Almacenero">Almacenero</option>
                                        </select>
                                        <div v-show="errorMostrarMsjPersona[0].rol" class="div-error">
                                            <div class="text-error">
                                                {{ errorMostrarMsjPersona[0].rol }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="field-1" class="control-label">Tipo Documento</label>
                                        <select v-model="tipo_documento" class="form-control">
                                            <option value="0" disabled>Seleccione...</option>
                                            <option value="C.C">C.C</option>
                                            <option value="RUT">RUT</option>
                                            <option value="T.I">T.I</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="field-2" class="control-label">Numero Del Documento</label>
                                        <input type="number" v-model="num_documento" class="form-control" placeholder="Ingrese numero de documento">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Direccion</label>
                                        <input type="text" v-model="direccion" class="form-control" placeholder="Ingrese direccion">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Telefono</label>
                                        <input type="number" v-model="telefono" class="form-control" placeholder="Ingrese telefono">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group" :class="errorMostrarMsjPersona[0].usuario?'has-error':''" >
                                        <label class="control-label">Usuario (*)</label>
                                        <input type="text" v-model="usuario" class="form-control" placeholder="Nombre de usuario">
                                        <div v-show="errorMostrarMsjPersona[0].usuario" class="div-error">
                                            <div class="text-error">
                                                {{ errorMostrarMsjPersona[0].usuario }}
                                            </div>
                                        </div>
                                        <div v-if="errores" class="div-error">
                                            <div class="text-error" v-for="error in errores.usuario" >
                                                {{ error }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" :class="errorMostrarMsjPersona[0].password?'has-error':''">
                                        <label class="control-label">Contraseña (*)</label>
                                        <div v-if="tipoAccion==2">
                                            <button class="form-control btn-primary" type="button" @click="abrirModalPassword(persona_id)">Cambiar contraseña</button>
                                        </div>
                                        <div v-else>
                                            <input type="password" v-model="password" class="form-control" placeholder="Contraseña..">
                                            <div v-show="errorMostrarMsjPersona[0].password" class="div-error">
                                                <div class="text-error">
                                                    {{ errorMostrarMsjPersona[0].password }}
                                                </div>
                                            </div>
                                            <div v-if="errores" class="div-error">
                                                <div class="text-error" v-for="error in errores.password" >
                                                    {{ error }}
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label">Email</label>
                                        <input type="email" v-model="email" class="form-control" placeholder="Ingrese el email">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div v-else>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group" :class="errorMostrarMsjPersona[0].passwordcambio?'has-error':''">
                                        <label class="control-label">Nueva Contraseña (*)</label>
                                        <input type="password" v-model="password" class="form-control" placeholder="Contraseña..">
                                        <div v-show="errorMostrarMsjPersona[0].passwordcambio" class="div-error">
                                            <div class="text-error">
                                                {{ errorMostrarMsjPersona[0].passwordcambio }}
                                            </div>
                                        </div>
                                        <div v-if="errores" class="div-error">
                                            <div class="text-error" v-for="error in errores.password" >
                                                * {{ error }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        

                    </form>
                </div>
                <!-- /.modal-content -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="cerrarModal()" >Cerrar</button>
                    <button type="button" v-if="tipoAccion==1" @click="registrarPersona()" class="btn btn-primary">Guardar</button>
                    <button type="button" v-if="tipoAccion==2" @click="actualizarPersona()" class="btn btn-primary">Actualizar</button>
                    <button type="button" v-if="tipoAccion==3" @click="CambiarPassword(persona_id)" class="btn btn-primary">Cambiar Contraseña</button>

                </div>
            </div><!-- /.modal-dialog -->

        </div>
    </div>
</div>  


</template>

<script>
    export default {
        data(){
          return{
            persona_id:0,
            nombre:'',
            tipo_documento:'',
            num_documento:'',
            direccion:'',
            telefono:'',
            email:'',
            usuario:'',
            user_id:'',
            password:'',
            rol:'',
            id_rol:'',
            arrayPersona:[],
            errores:[],
            modal: 0,
            tituloModal:'',
            tipoAccion:0,
            errorPersona : 0,
            errorMostrarMsjPersona : [{nombre:'',usuario:'',rol:'',password:'',passwordcambio:''}],
            pagination:{
                'total':0 ,
                'current_page':0 ,
                'per_page':0,
                'last_page':0,
                'from' :0,
                'to':0 ,
            },
            offset:3,
            buscar : '',
            tipo_busqueda:'nombre',
            num_entradas:'',
            
          }
        },
        computed:{
            isActived:function(){
                return this.pagination.current_page;
            },
            pagesNumber:function(){
                if(!this.pagination.to) {
                    return [];
                }
                
                var from = this.pagination.current_page - this.offset; 
                if(from < 1) {
                    from = 1;
                }

                var to = from + (this.offset * 2); 
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }  

                var pagesArray = [];
                while(from <= to) {
                    pagesArray.push(from);
                    from++;
                }
                return pagesArray;

            }
        }
        ,
        mounted() {
            this.listarPersona(1,this.tipo_busqueda,this.buscar); 

        },
        methods: {
            listarPersona(page,tipo_busqueda,buscar){
                let me=this;
                var url= 'user?page=' + page + '&tipo_busqueda='+tipo_busqueda +'&buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPersona = respuesta.personas.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarPagina(page,buscar,tipo_busqueda){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarPersona(page,tipo_busqueda,buscar);
            },
            registrarPersona(){
                if (this.validarPersona()){
                    return;
                }
                
                let me=this;
                if(this.tipo_documento==0){
                    this.tipo_documento='';
                }
                switch (this.rol) {
                    case "Administrador":
                        this.id_rol=1;
                        break;
                    case "Vendedor":
                        this.id_rol=2;
                        break;
                    case "Almacenero":
                        this.id_rol=3;
                        break;
                    default:
                        break;
                }
                axios.post('user/registrar',{
                    'nombre':this.nombre,
                    'tipo_documento':this.tipo_documento,
                    'num_documento':this.num_documento,
                    'direccion':this.direccion,
                    'telefono':this.telefono,
                    'email':this.email,
                    'password':this.password,
                    'rol_id':this.id_rol,
                    'usuario':this.usuario,
                }).then(function (response){
                    me.cerrarModal();
                    me.listarPersona(1,'',''); 
                }).catch(function(error){
                    if (error.response.status == 422){
                        if(me.tipo_documento==''){
                            me.tipo_documento=0;
                        }
                        me.errores=error.response.data.errors;
                    }
                })
            },
            actualizarPersona(){
               if (this.validarPersona()){
                    return;
                }
                
                let me = this;
                if(this.tipo_documento==0){
                    this.tipo_documento='';
                }
                switch (this.rol) {
                    case "Administrador":
                        this.id_rol=1;
                        break;
                    case "Vendedor":
                        this.id_rol=2;
                        break;
                    case "Almacenero":
                        this.id_rol=3;
                        break;
                    default:
                        break;
                }
                axios.put('user/actualizar',{
                    'nombre': this.nombre,
                    'id': this.persona_id,
                    'user_id':this.user_id,
                    'tipo_documento':this.tipo_documento,
                    'num_documento':this.num_documento,
                    'direccion':this.direccion,
                    'telefono':this.telefono,
                    'email':this.email,
                    'rol_id':this.id_rol,
                    'usuario':this.usuario
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPersona(1,'','');
                }).catch(function (error) {
                    if (error.response.status == 422){
                        if (me.tipo_documento=='') {
                            me.tipo_documento=0;
                        }
                        
                        me.errores=error.response.data.errors;
                    }
                }); 
            },
            desactivarUsuario(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de desactivar este Usuario!",
                  icon: "warning",
                  buttons: ["Cancelar","Desactivar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put('user/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPersona(1,'','');
                        swal("Usuario Desactivado!", {
                          icon: "success",
                        });
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                  }
                });
                
            },
            activarUsuario(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de activar este Usuario!",
                  icon: "warning",
                  buttons: ["Cancelar","Activar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put('user/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarPersona(1,'','');
                        swal("Usuario Activado!", {
                          icon: "success",
                        });
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                  }
                });
            },
            CambiarPassword(id){
                if (this.validarPersona()){
                    return;
                }
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de Cambiar la Contraseña!",
                  icon: "warning",
                  buttons: ["Cancelar","Cambiar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;

                    axios.put('user/actualizarP',{
                        'id': id,
                        'password':this.password
                    }).then(function (response) {
                        me.cerrarModal();
                        me.listarPersona(1,'','');
                        swal("Contraseña Actualizada!", {
                          icon: "success",
                        });
                    }).catch(function (error) {
                        if (error.response.status == 422){
                            me.errores=error.response.data.errors;
                        }
                    });
                    
                  }
                });
            },
            validarPersona(){
                this.errorPersona=0;
                this.errorMostrarMsjPersona =[{nombre:'',usuario:'',rol:'',password:'',passwordcambio:''}];
                if(this.tipoAccion==3){
                    if (!this.password){
                        this.errorMostrarMsjPersona[0].passwordcambio="* La contraseña del usuario no puede estar vacío.";
                    }else{
                        if (this.password.length<8) {
                            this.errorMostrarMsjPersona[0].passwordcambio="* La contraseña debe tener mas de 8 caracteres.";
                        }
                    }
                }else{
                    if (!this.nombre) this.errorMostrarMsjPersona[0].nombre="* El nombre del usuario no puede estar vacío.";
                    if (!this.usuario) this.errorMostrarMsjPersona[0].usuario="* El usuario no puede estar vacío.";
                    if (this.rol==0) this.errorMostrarMsjPersona[0].rol="* Seleccione un rol.";
                    if(this.tipoAccion==1){
                        if (!this.password){
                        this.errorMostrarMsjPersona[0].password="* La contraseña del usuario no puede estar vacío.";
                        }else{
                            if (this.password.length<8) {
                                this.errorMostrarMsjPersona[0].password="* La contraseña debe tener mas de 8 caracteres.";
                            }
                        }
                    }
                }

                

                
                if (this.errorMostrarMsjPersona[0].nombre || this.errorMostrarMsjPersona[0].usuario || this.errorMostrarMsjPersona[0].rol || this.errorMostrarMsjPersona[0].password || this.errorMostrarMsjPersona[0].passwordcambio) this.errorPersona = 1;

                return this.errorPersona;
            },
            cerrarModal(){
                $('#myModal').modal('hide');
                this.tituloModal='',
                this.nombre='',
                this.tipo_documento='',
                this.num_documento='',
                this.direccion='',
                this.telefono='',
                this.email='',
                this.usuario='',
                this.password='',
                this.rol='',
                this.user_id='',
                this.errorMostrarMsjPersona =[{nombre:'',usuario:'',rol:'',password:'',passwordcambio:''}],
                this.errores=[],
                this.errorPersona=0
            },
            abrirModalPassword(){
                this.tipoAccion=3;
                this.tituloModal = 'Cambiar Contraseña';
            },
            abrirModal(modelo, accion, data = []){
                this.errorMostrarMsjPersona =[{nombre:'',usuario:'',rol:'',password:'',passwordcambio:''}];
                switch(modelo){
                    case "persona":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                $('#myModal').modal('show');
                                this.tituloModal = 'Registrar Usuario';
                                this.nombre='';
                                this.tipo_documento=0;
                                this.num_documento='';
                                this.direccion='';
                                this.telefono='';
                                this.email='';
                                this.usuario='';
                                this.password='';
                                this.rol=0;
                                this.errorPersona=0;
                                this.tipoAccion = 1;
                                this.errores=[];
                                break;
                            }
                            case 'actualizar':
                            {
                                this.errorPersona=0;
                                this.user_id='';
                                this.errores=[];
                                $('#myModal').modal('show');
                                this.tituloModal='Actualizar Usuario';
                                this.tipoAccion=2;
                                this.persona_id=data['id'];
                                this.user_id=data.user['id'];
                                this.nombre =data['nombre'];
                                if(!data['tipo_documento']){
                                    this.tipo_documento=0;
                                }else{
                                    this.tipo_documento=data['tipo_documento'];
                                }
                                
                                this.num_documento=data['num_documento'];
                                this.direccion=data['direccion'];
                                this.telefono=data['telefono'];
                                this.email=data['email'];
                                this.usuario=data.user['usuario'];
                                this.rol=data.user.rol['nombre_rol']
                                break;
                            
                            }
                        }
                    }
                }
            }
        }

        
    }
</script>
<style>    
    .mostrar{
        display: list-item !important;
        opacity: 1 !important;
        background-color: #000000c9 !important;
    }
    .div-error{
        display: flex;
        justify-content: center;
    }
    .text-error{
        color: #ff0000c4 !important;
        width: 100%;
    }
</style>


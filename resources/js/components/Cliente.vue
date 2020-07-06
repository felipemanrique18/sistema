<template>
<div class="container">
    <div class="loadingio-spinner-spin-73ue9c5at0j" v-if="carga==0"><div class="ldio-yymc290haz">
    <div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div><div><div></div></div>
    </div></div>
    <div class="row" v-if="carga==1">
        <div class="col-sm-12">
            <div class="m-b-20">
                <div class="form-group container-titulo">
                    <h2>
                        <b>Clientes</b>
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
                                <th>Tipo documento</th>
                                <th>Numero</th> 
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Email</th>
                                <th>Accion</th>
                                
                            </tr>
                            </thead>


                            <tbody>
                            <tr v-for="persona in arrayPersona" :key="persona.id">
                                <td v-text="persona.nombre"></td>
                                <td v-text="persona.tipo_documento"></td>
                                <td v-text="persona.num_documento"></td>
                                <td v-text="persona.direccion"></td>
                                <td v-text="persona.telefono"></td>
                                <td v-text="persona.email"></td>
                                <td>
                                   <button type="button" class="btn btn-sm btn-primary" @click="abrirModal('persona','actualizar',persona)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fa fa-edit"></i></button> 
                                        
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
                   <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                        <div class="form-group row" :class="errorMostrarMsjPersona[0].nombre?'has-error':''">
                            <label class="col-md-3 form-control-label" for="text-input">Nombre</label>
                            <div class="col-md-9">
                                <input type="text" v-model="nombre" class="form-control" placeholder="Nombre de cliente">
                                <div v-show="errorMostrarMsjPersona[0].nombre" class="div-error">
                                    <div class="text-error">
                                        {{ errorMostrarMsjPersona[0].nombre }}
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Tipo Documento</label>
                            <div class="col-md-9">
                                <select v-model="tipo_documento" class="form-control">
                                    <option value="0" disabled>Seleccione...</option>
                                    <option value="C.C">C.C</option>
                                    <option value="RUT">RUT</option>
                                    <option value="T.I">T.I</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Numero Del Documento</label>
                            <div class="col-md-9">
                                <input type="number" v-model="num_documento" class="form-control" placeholder="Ingrese numero de documento">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Direccion</label>
                            <div class="col-md-9">
                                <input type="text" v-model="direccion" class="form-control" placeholder="Ingrese direccion">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Telefono</label>
                            <div class="col-md-9">
                                <input type="number" v-model="telefono" class="form-control" placeholder="Ingrese telefono">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Email</label>
                            <div class="col-md-9">
                                <input type="email" v-model="email" class="form-control" placeholder="Ingrese el email">
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.modal-content -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="cerrarModal()" >Cerrar</button>
                    <button type="button" v-if="tipoAccion==1" :disabled="estado_boton.guardar" @click="registrarPersona()" class="btn btn-primary">Guardar</button>
                    <button type="button" v-if="tipoAccion==2" :disabled="estado_boton.actualizar" @click="actualizarPersona()" class="btn btn-primary">Actualizar</button>
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
            arrayPersona:[],
            modal: 0,
            tituloModal:'',
            tipoAccion:0,
            errorPersona : 0,
            errorMostrarMsjPersona : [{nombre:''}],
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
            estado_boton:{
                guardar:false,
                actualizar:false
            },
            carga:0,


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
                var url= 'cliente?page=' + page + '&tipo_busqueda='+tipo_busqueda +'&buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayPersona = respuesta.personas.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';
                    me.carga=1;
                })
                .catch(function (error) {
                    me.mostrarerror(error);
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
                me.estado_boton.guardar=true;
                axios.post('cliente/registrar',{
                    'nombre':this.nombre,
                    'tipo_documento':this.tipo_documento,
                    'num_documento':this.num_documento,
                    'direccion':this.direccion,
                    'telefono':this.telefono,
                    'email':this.email
                }).then(function (response){
                    me.cerrarModal();
                    me.listarPersona(1,'',''); 
                }).catch(function(error){
                    me.mostrarerror(error);
                    console.log(error);
                })
            },
            actualizarPersona(){
               if (this.validarPersona()){
                    return;
                }
                
                let me = this;
                me.estado_boton.actualizar=true;
                axios.put('cliente/actualizar',{
                    'nombre': this.nombre,
                    'id': this.persona_id,
                    'tipo_documento':this.tipo_documento,
                    'num_documento':this.num_documento,
                    'direccion':this.direccion,
                    'telefono':this.telefono,
                    'email':this.email
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPersona(1,'','');
                }).catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                }); 
            },
            validarPersona(){
                this.errorPersona=0;
                this.errorMostrarMsjPersona =[{nombre:''}];

                if (!this.nombre) this.errorMostrarMsjPersona[0].nombre="* El nombre del cliente no puede estar vacío.";
                if (this.errorMostrarMsjPersona[0].nombre) this.errorPersona = 1;

                return this.errorPersona;
            },
            cerrarModal(){
                $('#myModal').modal('hide');
                this.tituloModal='',
                this.nombre='',
                this.tipo_documento=0,
                this.num_documento='',
                this.direccion='',
                this.telefono='',
                this.email='',
                this.errorPersona=0,
                this.errorMostrarMsjPersona=[{nombre:''}]
            },
            abrirModal(modelo, accion, data = []){
                this.estado_boton.guardar=false;
                this.estado_boton.actualizar=false;
                this.errorMostrarMsjPersona=[{nombre:''}];
                switch(modelo){
                    case "persona":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                $('#myModal').modal('show');
                                this.tituloModal = 'Registrar Clientes';
                                this.nombre='';
                                this.tipo_documento=0;
                                this.num_documento='';
                                this.direccion='';
                                this.telefono='';
                                this.email='';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                $('#myModal').modal('show');
                                this.tituloModal='Actualizar Cliente';
                                this.tipoAccion=2;
                                this.persona_id=data['id'];
                                this.nombre = data['nombre'];
                                this.tipo_documento=data['tipo_documento'];
                                this.num_documento=data['num_documento'];
                                this.direccion=data['direccion'];
                                this.telefono=data['telefono'];
                                this.email=data['email'];
                                break;
                            
                            }
                        }
                    }
                }
            },
            mostrarerror(error){
                switch (error.response.status) {
                    case 500:
                        swal("Eroor!", {
                          icon: "error",
                          text: "Actualiza tu fecha!",
                          buttons: false,
                          timer: 3000,
                        });
                        break;
                    case 401:
                        swal("Eroor!", {
                          icon: "error",
                          text: "A caducado tu session!",
                          buttons: false,
                          timer: 3000,
                        });
                        window.location.reload(); 
                        break;
                    case 419:
                        swal("Eroor!", {
                          icon: "error",
                          text: "A caducado tu session!",
                          buttons: false,
                          timer: 3000,
                        });
                        window.location.reload(); 
                        break;
                    default:
                        // statements_def
                        break;
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


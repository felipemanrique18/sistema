<template>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="m-b-20">
                <div class="form-group container-titulo">
                    <h2>
                        <b>Categorias</b>
                        <button class="btn btn-success pull-right" type="button" @click="abrirModal('categoria','registrar')">
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
                            <font _mstmutation="1" _msthash="917306" _msttexthash="138502">Búsqueda:</font>
                            <input type="search" v-model="buscar" v-on:keypress="listarCategoria(1,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                            <button type="submit" @click="listarCategoria(1,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                        </label>
                    </div>
                        <div class="table-responsive">
                            <table id="datatable-buttons" class="table table-striped table-bordered display responsive nowrap" style="width:100%">
                                <thead>
                                <tr>
                                    <th >Nombre</th>
                                    <th data-title="Descripcion">Descripcion</th>
                                    <th data-title="Estado">Estado</th>
                                    <th data-title="Accion">Accion</th>
                                </tr>
                                </thead>


                                <tbody>
                                <tr v-for="categoria in arrayCategoria" :key="categoria.id">
                                    <td v-text="categoria.nombre"></td>
                                    <td >
                                        <div style='width:200px; overflow:hidden;' v-text="categoria.descripcion"></div>
                                    </td>
                                    <td>
                                        <div v-if="categoria.condicion">
                                            <span class="label label-success">Activo</span>
                                            
                                        </div>
                                        <div v-else>
                                            <span class="label label-danger">Desactivado</span>
                                            
                                        </div>
                                    </td>
                                    <td>
                                        
                                        <template v-if="categoria.condicion">
                                            <button type="button" class="btn btn-sm btn-primary" @click="abrirModal('categoria','actualizar',categoria)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fa fa-edit"></i></button>

                                            <button type="button" class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Desactivar" @click="desactivarCategoria(categoria.id)" ><i class="fa fa-trash-alt"></i></button>
                                        </template>

                                        <template v-else>
                                            <button type="button" class="btn btn-sm btn-success"  data-toggle="tooltip" data-placement="top" title="" data-original-title="Activar" @click="activarCategoria(categoria.id)"><i class="fa fa-check"></i></button>
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
                                        <a href="" @click.prevent="cambiarPagina(pagination.current_page-1,buscar)"><i class="fa fa-angle-left"></i></a>
                                    </li>
                                    <li :class="[page == isActived ? 'active' : '']" v-for="page in pagesNumber" :key="page">
                                        <a href="" @click.prevent="cambiarPagina(page,buscar)" v-text="page"></a>
                                    </li>
                                    <li v-if="pagination.current_page < pagination.last_page">
                                        <a href="" @click.prevent="cambiarPagina(pagination.current_page+1,buscar)"><i class="fa fa-angle-right"></i></a>
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
                        <div class="form-group row " :class="[errorMostrarMsjCategoria[0].nombre? 'has-error' : '']">
                            <label class="col-md-3 form-control-label" for="field-1">Nombre (*)</label>
                            <div class="col-md-9">
                                <input type="text" v-model="nombre" class="form-control" placeholder="Nombre de categoría">
                                <div v-show="errorCategoria" class="div-error">
                                    <div class="text-error">
                                        <div v-text="errorMostrarMsjCategoria[0].nombre">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Descripción</label>
                            <div class="col-md-9">
                                <input type="text" v-model="descripcion" class="form-control" placeholder="Ingrese descripción">
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.modal-content -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="cerrarModal()" >Cerrar</button>
                    <button type="button" v-if="tipoAccion==1" @click="registrarCategoria()" class="btn btn-primary">Guardar</button>
                    <button type="button" v-if="tipoAccion==2" @click="actualizarCategoria()" class="btn btn-primary">Actualizar</button>
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
            categoria_id:0,
            nombre:'',
            descripcion:'',
            arrayCategoria:[],
            modal: 0,
            tituloModal:'',
            tipoAccion:0,
            errorCategoria : 0,
            errorMostrarMsjCategoria : [{nombre:''}],
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
            num_entradas:''


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
            
            this.listarCategoria(1,this.buscar);      
        },
        methods: {
            listarCategoria(page,buscar){
                let me=this;
                var url= 'categoria?page=' + page + '&buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayCategoria = respuesta.categorias.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';

                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });

            },
            cambiarPagina(page,buscar){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarCategoria(page,buscar);
            },
            registrarCategoria(){
                if (this.validarCategoria()){
                    return;
                }
                
                let me=this;
                var url = 'categoria/registrar';
                axios.post(url, {
                    nombre:this.nombre,
                    descripcion:this.descripcion
                }).then(response => {
                    me.cerrarModal();
                    me.listarCategoria(1,''); 
                }).catch(error => {
                    me.mostrarerror(error);
                    console.log(error);
                });
                // axios.post('categoria/registrar',{
                //     'nombre':this.nombre,
                //     'descripcion':this.descripcion
                // }).then(function (response){
                //     me.cerrarModal();
                //     me.listarCategoria(1,''); 
                //     console.log(response);
                // }).catch(function(error){
                //     console.log(error);
                // })
            },
            actualizarCategoria(){
               if (this.validarCategoria()){
                    return;
                }
                
                let me = this;

                axios.put('categoria/actualizar',{
                    'nombre': this.nombre,
                    'descripcion': this.descripcion,
                    'id': this.categoria_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarCategoria(1,'');
                }).catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                }); 
            },
            validarCategoria(){
                this.errorCategoria=0;
                this.errorMostrarMsjCategoria =[{nombre:''}];
                if (!this.nombre) this.errorMostrarMsjCategoria[0].nombre="* El nombre de la categoría no puede estar vacío.";

                if (this.errorMostrarMsjCategoria[0].nombre) this.errorCategoria = 1;

                return this.errorCategoria;
            },
            desactivarCategoria(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de desactivar esta categoria!",
                  icon: "warning",
                  buttons: ["Cancelar","Desactivar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put('categoria/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarCategoria(1,me.buscar);
                        swal("Categoría Desactivada!", {
                          icon: "success",
                        });
                    }).catch(function (error) {
                        me.mostrarerror(error);
                        console.log(error);
                    });
                    
                  }
                });
                
            },
            activarCategoria(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de activar esta categoria!",
                  icon: "warning",
                  buttons: ["Cancelar","Activar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put('categoria/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarCategoria(1,me.buscar);
                        swal("Categoría Activada!", {
                          icon: "success",
                        });
                    }).catch(function (error) {
                        me.mostrarerror(error);
                        console.log(error);
                    });
                    
                  }
                });
            },
            cerrarModal(){
                $('#myModal').modal('hide');
                this.tituloModal='',
                this.nombre='',
                this.descripcion=''
                this.errorCategoria=0;
                this.errorMostrarMsjCategoria =[{nombre:''}];
            },
            abrirModal(modelo, accion, data = []){
                this.errorMostrarMsjCategoria =[{nombre:''}];
                switch(modelo){
                    case "categoria":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                $('#myModal').modal('show');
                                this.tituloModal = 'Registrar Categoría';
                                this.nombre= '';
                                this.descripcion = '';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                $('#myModal').modal('show');
                                this.tituloModal='Actualizar categoría';
                                this.tipoAccion=2;
                                this.categoria_id=data['id'];
                                this.nombre = data['nombre'];
                                this.descripcion= data['descripcion'];
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


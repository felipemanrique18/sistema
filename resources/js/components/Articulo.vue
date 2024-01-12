
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
                        <b>Art&iacute;culos</b>
                        <div class="pull-right">
                            
                            <button class="btn btn-success " type="button" @click="abrirModal('articulo','registrar')">
                            <i class="fa fa-plus"></i> Nuevo
                            </button>
                            <button class="btn btn-warning" type="button" @click="cargarPdf()">
                            <i class="fas fa-file-invoice-dollar"></i>
                            </button>
                        </div>
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
                            <input type="search" v-model="buscar" v-on:keypress="listarArticulo(1,buscar)" v-on:blur="listarArticulo(1,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                            <button type="submit" @click="listarArticulo(1,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                        </label>
                    </div>
                    <div class="table-responsive">                          
                        <table id="datatable-buttons" class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Categoría</th>
                                <th>Descripcion</th>
                                <th>Precio Venta</th>
                                <th>Stock</th>
                                <th>Codigo</th>
                                <th>Estado</th>
                                <th>Accion</th>
                            </tr>
                            </thead>


                            <tbody>
                            <tr v-for="articulo in arrayArticulo" :key="articulo.id">
                                <td v-text="articulo.nombre"></td>
                                <td >{{ articulo.categoria['nombre']}}</td>
                                <td >
                                    <div style='width:200px; overflow:hidden;' v-text="articulo.descripcion"></div>
                                </td>
                                <td>{{ formatNumber(articulo.precio_venta) }}</td>
                                <td v-text="articulo.stock"></td>
                                <td v-text="articulo.codigo"></td>
                                <td>
                                    <div v-if="articulo.condicion">
                                        <span class="label label-success">Activo</span>
                                        
                                    </div>
                                    <div v-else>
                                        <span class="label label-danger">Desactivado</span>
                                        
                                    </div>
                                </td>
                                <td>
                                    
                                    <template v-if="articulo.condicion">
                                        <button type="button" class="btn btn-sm btn-primary" @click="abrirModal('articulo','actualizar',articulo)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fa fa-edit"></i></button>

                                        <button type="button" class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Desactivar" @click="desactivarArticulo(articulo.id)" ><i class="fa fa-trash-alt"></i></button>
                                    </template>

                                    <template v-else>
                                        <button type="button" class="btn btn-sm btn-success"  data-toggle="tooltip" data-placement="top" title="" data-original-title="Activar" @click="activarArticulo(articulo.id)"><i class="fa fa-check"></i></button>
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
    <!-- inicio modal -->
    <div id="myModal" class="modal fade in" :class="{'mostrar' : modal}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" @click="cerrarModal()" aria-hidden="true">×</button>
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                </div>
                <div class="modal-body">
                   <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                        <div class="form-group row" :class="errorMostrarMsjArticulo[0].nombre?'has-error':''">
                            <label class="col-md-3 form-control-label" for="text-input">Nombre (*)</label>
                            <div class="col-md-9">
                                <input type="text" v-model="nombre" class="form-control" placeholder="Nombre del articulo">
                                <div v-show="errorMostrarMsjArticulo[0].nombre" class="text-error" >
                                    {{ errorMostrarMsjArticulo[0].nombre }}
                                </div>
                            </div> 
                            
                        </div>
                        <div class="form-group row" :class="errorMostrarMsjArticulo[0].categoria?'has-error':''">
                            <label class="col-md-3 form-control-label" for="text-input">Categoría (*)</label>
                            <div class="col-md-9">
                                <select v-model="idcategoria" class="form-control" style="width: 100%;" >
                                    <option v-if="tipoAccion==2 && nombre_categoria['condicion']==0" v-bind:value="nombre_categoria['id']" disabled>{{ nombre_categoria['nombre'] }}</option>
                                    <option v-if="tipoAccion==1" v-bind:value="0" disabled>Seleccione...</option>
                                    <option v-for="categoria in arrayCategorias" :key="categoria.id" v-text="categoria.nombre" v-bind:value="categoria.id"></option>
                                </select>
                                <div v-show="errorMostrarMsjArticulo[0].categoria" class="text-error" >
                                    {{ errorMostrarMsjArticulo[0].categoria }}
                                </div>
                        
                            </div>
                            
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="email-input">Descripción</label>
                            <div class="col-md-9">
                                <input type="text" v-model="descripcion" class="form-control" placeholder="Ingrese descripción">
                            </div>
                        </div>
                        <div class="form-group row" :class="errorMostrarMsjArticulo[0].precio?'has-error':''">
                            <label class="col-md-3 form-control-label" for="email-input">Precio Venta (*)</label>
                            <div class="col-md-9">
                                <input type="number" v-model="precio_venta" class="form-control" placeholder="Ingrese el precio de venta">
                                <div v-show="errorMostrarMsjArticulo[0].precio" class="text-error" >
                                    {{ errorMostrarMsjArticulo[0].precio }}
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" :class="errorMostrarMsjArticulo[0].stock?'has-error':''">
                            <label class="col-md-3 form-control-label" for="email-input">Stock (*)</label>
                            <div class="col-md-9">
                                <input type="number" v-model="stock" class="form-control" placeholder="Ingrese el numero de elementos">
                                <div v-show="errorMostrarMsjArticulo[0].stock" class="text-error" >
                                    {{ errorMostrarMsjArticulo[0].stock }}
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="text-input">Codigo</label>
                            <div class="col-md-9">
                                <input type="text" v-model="codigo" class="form-control" placeholder="Codigo de barras">
                                <barcode :value="codigo" :option="{format:'EAN-13'}">Genearando codigo de barras</barcode>
                            </div>  
                                                
                        </div>
                        
                    </form>
                </div>
                <!-- /.modal-content -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="cerrarModal()" >Cerrar</button>
                    <button type="button" v-if="tipoAccion==1" :disabled="estado_boton.guardar" @click="registrarArticulo()" class="btn btn-primary">Guardar</button>
                    <button type="button" v-if="tipoAccion==2" :disabled="estado_boton.actualizar" @click="actualizarArticulo()" class="btn btn-primary">Actualizar</button>
                </div>
            </div><!-- /.modal-dialog -->

        </div>
    </div>
</div>  


</template>

<script>
    import VueBarcode from 'vue-barcode';
    import Select2 from 'v-select2-component';
    // declare Select2Component

    export default {
        data(){
          return{
            articulo_id:0,
            idcategoria : 0,
            nombre_categoria:[],
            codigo:0,
            precio_venta:0,
            stock:0,
            nombre:'',
            descripcion:'',
            arrayArticulo:[],
            modal: 0,
            tituloModal:'',
            tipoAccion:0,
            errorArticulo : 0,
            errorMostrarMsjArticulo : [{nombre:'',categoria:'',stock:'',precio:''}],
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
            num_entradas:'',
            arrayCategorias:[],
            estado_boton:{
                guardar:false,
                actualizar:false
            },
            carga:0,



          }
        },
        components: {
            'barcode': VueBarcode,
            Select2            
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

            this.listarArticulo(1,this.buscar); 
            // let initScript = document.createElement('script');
            // initScript.setAttribute('src', 'assets/pages/jquery.datatables.init.js');
            // document.head.appendChild(initScript);

        },
        methods: {
            listarArticulo(page,buscar){
                let me=this;
                var url= this.$api+'articulo?page=' + page + '&buscar=' + buscar;
                axios.get(url,this.$token).then(function (response) {
                    var respuesta= response.data;
                    me.arrayArticulo = respuesta.articulos.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';
                    me.carga=1
                })
                .catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                });
            },
            selectCategoria(){
                let me=this;
                var url= this.$api+'categoria/selectCategoria';
                axios.get(url,this.$token).then(function (response) {
                    console.log(response);
                    var respuesta= response.data;
                    me.arrayCategorias = respuesta.categorias;
                    
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
                me.listarArticulo(page,buscar);
            },
            registrarArticulo(){
                if (this.validarArticulo()){
                    return;
                }
                
                let me=this;
                me.estado_boton.guardar=true;
                axios.post(this.$api+'articulo/registrar',{
                    'categoria_id':this.idcategoria,
                    'nombre':this.nombre,
                    'descripcion':this.descripcion,
                    'codigo':this.codigo,
                    'stock':this.stock,
                    'precio_venta':this.precio_venta
                    
                }).then(function (response){
                    me.cerrarModal();
                    me.listarArticulo(1,''); 
                }).catch(function(error){
                    me.mostrarerror(error);
                    console.log(error);
                })
            },
            actualizarArticulo(){
               if (this.validarArticulo()){
                    return;
                }
                
                let me = this;
                me.estado_boton.actualizar=true;
                axios.put(this.$api+'articulo/actualizar',{
                    'id':this.articulo_id,
                    'categoria_id':this.idcategoria,
                    'nombre':this.nombre,
                    'descripcion':this.descripcion,
                    'codigo':this.codigo,
                    'stock':this.stock,
                    'precio_venta':this.precio_venta
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarArticulo(1,'');
                    swal("Articulo Actualizado!", {
                          icon: "success",
                        });
                }).catch(function (error) {
                    me.mostrarerror(error);
                    console.log(error);
                }); 
            },
            validarArticulo(){
                this.errorArticulo=0;
                this.errorMostrarMsjArticulo =[{nombre:'',categoria:'',stock:'',precio:''}];

                if (!this.nombre) this.errorMostrarMsjArticulo[0].nombre="* El nombre del articulo no puede estar vacío.";
                if (this.idcategoria==0) this.errorMostrarMsjArticulo[0].categoria="*Seleccione una categoria.";
                if (this.stock<=0) this.errorMostrarMsjArticulo[0].stock="*El Stock no puede estar vacío.";
                if (this.precio_venta<=0) this.errorMostrarMsjArticulo[0].precio="*El precio de venta debe ser numerico no puede estar vacío.";
                if (this.errorMostrarMsjArticulo[0].nombre || this.errorMostrarMsjArticulo[0].categoria || this.errorMostrarMsjArticulo[0].stock || this.errorMostrarMsjArticulo[0].precio) this.errorArticulo = 1;

                return this.errorArticulo;
            },
            desactivarArticulo(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de desactivar este Articulo!",
                  icon: "warning",
                  buttons: ["Cancelar","Desactivar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put(this.$api+'articulo/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarArticulo(1,me.buscar);
                        swal("Articulo Desactivado!", {
                          icon: "success",
                        });
                    }).catch(function (error) {
                        me.mostrarerror(error);
                        console.log(error);
                    });
                    
                  }
                });
                
            },
            activarArticulo(id){
                swal({
                  title: "Estas seguro?",
                  text: "Estas seguro de activar este Artículo!",
                  icon: "warning",
                  buttons: ["Cancelar","Activar"],
                  dangerMode: true,
                })
                .then((willDelete) => {
                  if (willDelete) {
                    let me = this;
                    axios.put(this.$api+'articulo/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarArticulo(1,me.buscar);
                        swal("Articulo Activado!", {
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
                this.nombre_categoria=[],
                this.descripcion='',
                this.idcategoria=0,
                this.codigo='',
                this.nombre='',
                this.precio_venta=0,
                this.stock=0,
                this.errorArticulo=0,
                this.errorMostrarMsjArticulo=[{nombre:'',categoria:'',stock:'',precio:''}]
            },
            abrirModal(modelo, accion, data = []){
                this.estado_boton.guardar=false;
                this.estado_boton.actualizar=false;
                this.errorMostrarMsjArticulo =[{nombre:'',categoria:'',stock:'',precio:''}];
                switch(modelo){
                    case "articulo":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                
                                this.tituloModal = 'Registrar Artículo';
                                this.idcategoria=0;
                                this.nombre_categoria=[];
                                this.codigo='';
                                this.nombre= '';
                                this.precio_venta=0;
                                this.stock=0;
                                this.descripcion = '';
                                this.tipoAccion = 1;
                                $('#myModal').modal('show')
                                break;
                            }
                            case 'actualizar':
                            {
                                let numero = data['precio_venta'];
                                $('#myModal').modal('show');
                                this.tituloModal='Actualizar Artículo';
                                this.tipoAccion=2;
                                this.articulo_id=data['id'];
                                this.nombre_categoria=data['categoria'];
                                this.nombre=data['nombre'];
                                this.idcategoria=data['categoria_id'];
                                this.codigo=data['codigo'];
                                this.stock=data['stock'];
                                this.precio_venta= Math.floor(numero).toString();
                                this.descripcion= data['descripcion'];
                                break;
                            
                            }
                        }
                        this.selectCategoria();
                    }
                }
            },
            cargarPdf(){
                window.open('/articulo/listarPdf','_blank')
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
            },
            formatNumber(n){
               let formatoNumero = new Intl.NumberFormat('es-CO', {
                    style: 'currency',
                    currency: 'COP',
                    minimumFractionDigits: 0,
                    maximumFractionDigits: 2
                }).format(n);

                // Eliminar los decimales si son 00
                formatoNumero = formatoNumero.replace(/\.00$/, '');

                // Retornar el número formateado
                return formatoNumero;
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


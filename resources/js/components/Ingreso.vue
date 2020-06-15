<template>
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="m-b-20">
                <div class="form-group container-titulo">
                    <h2>
                        <b>Ingresos</b>
                        <template v-if="listado==1">
                            <button class="btn btn-success pull-right" type="button" @click="mostrarDetalle()">
                            <i class="fa fa-plus"></i> Nuevo
                            </button>
                        </template>
                    </h2>
                </div>
                
                <!-- <p class="text-muted font-13 m-b-30">
                    The Buttons extension for DataTables provides a common set of options, API methods and
                    styling to display buttons on a page that will interact with a DataTable. The core
                    library provides the based framework upon which plug-ins can built.
                </p> -->
                <!-- listado ingresos -->
                <template v-if="listado==1">
                    
                    <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                        <div class="dataTables_filter">
                            <label>
                                <select v-model="tipo_busqueda" class="form-control input-sm">
                                    <option value="num_comprobante">Numero Comprobante</option>
                                    <option value="serie_comprobante">Serie Comprobante</option>
                                    <option value="fecha">fecha</option>
                                </Select>
                                <input type="search" v-model="buscar" @keyup="listarIngreso(1,tipo_busqueda,buscar)" @keyup.delete="listarIngreso(1,tipo_busqueda,buscar)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                                <button type="submit" @click="listarIngreso(1,tipo_busqueda,buscar)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                            </label>
                        </div>
                        <div class="table-responsive">
                            
                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Proveedor</th>
                                    <th>Usuario</th>
                                    <th>Tipo Comprobante</th>
                                    <th>Serie Comprobante</th>
                                    <th>Numero Comprobante</th>
                                    <th>Fecha Hora</th>
                                    <th>Impuesto</th>
                                    <th>Total</th>
                                    <th>Accion</th>
                                    
                                </tr>
                                </thead>


                                <tbody>
                                <tr v-for="ingreso in arrayIngreso" :key="ingreso.id">
                                    <td v-text="ingreso.proveedor.contacto"></td>
                                    <td v-text="ingreso.usuario.persona.nombre"></td>
                                    <td v-text="ingreso.tipo_comprobante"></td>
                                    <td v-text="ingreso.serie_comprobante"></td>
                                    <td v-text="ingreso.num_comprobante"></td>
                                    <td v-text="ingreso.fecha_hora"></td>
                                    <td v-text="ingreso.impuesto"></td>
                                    <td>{{ formatNumber(ingreso.total) }}</td>
                                    <td>       
                                        <template v-if="ingreso.estado">
                                            <button type="button" class="btn btn-sm btn-info" @click="verIngreso(ingreso)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fas fa-eye"></i></button>

                                            <!-- <button type="button" class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Desactivar" @click="desactivarUsuario(persona.persona_id)" ><i class="fa fa-trash-alt"></i></button> -->
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
                </template>
                <!-- fin listado ingresos -->

                <!-- detalles -->
                <template v-else-if="listado==0">
                    <div>
                        <form action="#" method="POST" enctype="multipart/form-data" v-on:submit.prevent>
                            <div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group " :class="[errorMostrarMsjIngreso[0].proveedor? 'has-error' : '']">
                                            <label class="control-label">Proveedor (*)</label>
                                            <v-select v-model="idproveedor"
                                                @search="selectProveedor"
                                                @search:blur="validarIngreso('proveedor')"
                                                @input="validarIngreso('proveedor')"
                                                label="nombre"
                                                :options="arrayProveedor"
                                                placeholder="Buscar Proveedores..."                                    
                                            >

                                            </v-select>
                                            <div v-show="errorMostrarMsjIngreso[0].proveedor" class="text-error">
                                                {{ errorMostrarMsjIngreso[0].proveedor }}
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group "  :class="[errorMostrarMsjIngreso[0].impuesto? 'has-error' : '']">
                                            <label for="field-1" class="control-label">Impuesto</label>
                                             <input type="number" v-model="impuesto" class="form-control" placeholder="Ingrese inpuesto " min="0" @blur="validarIngreso('impuesto')">
                                             <div v-show="errorMostrarMsjIngreso[0].impuesto" class="text-error" >
                                                {{ errorMostrarMsjIngreso[0].impuesto }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group " :class="[errorMostrarMsjIngreso[0].comprobante? 'has-error' : '']">
                                            <label for="field-1" class="control-label">Tipo Comprobante (*)</label>
                                            <select v-model="tipo_comprobante" class="form-control" @blur="validarIngreso('comprobante')">
                                                <option value="0" disabled>Seleccione...</option>
                                                <option value="Boleta">Boleta</option>
                                                <option value="Factura">Factura</option>
                                                <option value="Ticket">Ticket</option>
                                            </select>
                                            <div v-show="errorMostrarMsjIngreso[0].comprobante" class="text-error">
                                                {{ errorMostrarMsjIngreso[0].comprobante }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Serie</label>
                                             <input type="number" v-model="serie_comprobante" class="form-control" placeholder="000x" min="0">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group " :class="[errorMostrarMsjIngreso[0].num_comprobante? 'has-error' : '']">
                                            <label for="field-2" class="control-label">Numero (*)</label>
                                            <input type="number" v-model="num_comprobante" class="form-control" placeholder="00xxx" min="0" @blur="validarIngreso('num_comprobante')">
                                            <div v-show="errorMostrarMsjIngreso[0].num_comprobante" class="text-error">
                                                {{ errorMostrarMsjIngreso[0].num_comprobante }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Articulo <span v-show="idarticulo==0" style="color: red">Seleccione</span></label>
                                            <div class="input-group">
                                                <input type="text" v-model="codigo" @keyup="buscarArticulo()" @keyup.delete="buscarArticulo()" class="form-control" placeholder="Ingrese codigo de barras"></input>
                                                <span class="input-group-btn">
                                                    <button class="btn" @click="abrirModal()"><i class="fa fa-search"></i></button>
                                                </span>
                                                
                                            </div>
                                            <input type="text" v-model="articulo" readonly class="form-control"></input>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label">Cantidad</label>
                                            <input type="number" value="0" v-model="cantidad" class="form-control" placeholder="Ingrese cantidad" min="1">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label">Precio</label>
                                            <input type="number" value="0" v-model="precio" class="form-control" placeholder="Ingrese precio del articulo" min="0">
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label"> </label>
                                            <button class="btn btn-success form-control" @click="agregarDetalle()"><i class="fa fa-plus"></i> Agregar</button>
                                        </div>
                                    </div>
                                   
                                </div>
                                <div class="row">
                                    <div class="table-responsive ">
                                        <table  class="table table-striped table-bordered table-sm">
                                            <thead>
                                                <tr>
                                                    <th>Articulo</th>
                                                    <th>Precio</th>
                                                    <th>Cantidad</th>
                                                    <th>Subtotal</th>
                                                    <th>Accion</th>
                                                </tr>
                                            </thead>
                                            <tbody v-if="arrayDetalle.length">
                                                <tr v-for="(detalle,index) in arrayDetalle" :key="detalle.id">
                                                    <td v-text="detalle.articulo"></td>
                                                    <td><input type="number" class="form-control" min="0" v-model="detalle.precio" name=""></td>
                                                    <td><input type="number" class="form-control" v-model="detalle.cantidad" name=""></td>
                                                    <td>{{ formatNumber((detalle.precio*detalle.cantidad)) }}</td>
                                                    <td>
                                                        <button class="btn btn-danger btn-sm" @click="eliminarDetalle(index),validarIngreso('articulo')">
                                                            <i class="fa fa-trash-alt"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Parcial: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ formatNumber(totalparcial=(total-totalimpuesto)) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Impuesto: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ formatNumber(totalimpuesto=((total*impuesto)/(1+impuesto))) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Neto: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ formatNumber(total=calculartotal) }}</td>
                                                </tr>
                                            </tbody>
                                            <tbody v-else>
                                                <tr>
                                                    <td colspan="5">
                                                        No hay articlos agregados
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                        
                                    </div>
                                    <div v-show="errorMostrarMsjIngreso[0].articulo" class="text-error">
                                        {{ errorMostrarMsjIngreso[0].articulo }}
                                    </div>
                                     <!-- <div v-show="errorIngreso" class="div-error">
                                        <div class="text-error">
                                            <div v-for="error in errorMostrarMsjIngreso" :key="error" v-text="error">

                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label"></label>
                                            <button class="btn btn-danger form-control" @click="ocultarDetalle()">Cerrar</button>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label"></label>
                                            <button class="btn btn-primary form-control" @click="registrarIngreso()">Registrar Compra</button>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            

                        </form>
                    </div>
                </template>
                <!-- fin detalles -->
                <!-- ver detalles -->
                <template v-else-if="listado==2">
                    <div>
                        <form action="#" method="POST" enctype="multipart/form-data" v-on:submit.prevent>
                            <div>
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label class="control-label">Proveedor</label>
                                            <input type="text" class="form-control" readonly v-model="proveedor" ></input>
                                            
            

                                    </v-select>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Impuesto</label>
                                            <input type="text" class="form-control" readonly v-model="impuesto"></input>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Tipo Comprobante (*)</label>
                                            <input type="text" class="form-control" readonly v-model="tipo_comprobante" ></input>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="field-1" class="control-label">Serie</label>
                                            <input type="text" class="form-control" readonly v-model="serie_comprobante"></input>
                                            
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="field-2" class="control-label">Numero</label>
                                            <input type="text" class="form-control" readonly v-model="num_comprobante" ></input>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">
                                        <table  class="table table-striped table-bordered table-sm">
                                            <thead>
                                                <tr>
                                                    <th>Articulo</th>
                                                    <th>Precio</th>
                                                    <th>Cantidad</th>
                                                    <th>Subtotal</th>
                                                </tr>
                                            </thead>
                                            <tbody v-if="arrayDetalle.length">
                                                <tr v-for="(detalle) in arrayDetalle" :key="detalle.id">
                                                    <td v-text="detalle.articulo.nombre"></td>
                                                    <td v-text="detalle.precio"></td>
                                                    <td v-text="detalle.cantidad"></td>
                                                    <td>
                                                        {{ detalle.precio*detalle.cantidad }}
                                                    </td>
                                                    
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Parcial: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ totalparcial=(total-totalimpuesto).toFixed(2) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Impuesto: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ totalimpuesto=((total*impuesto)/(1+impuesto)).toFixed(2) }}</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right"></td>
                                                    <td>
                                                        <strong>
                                                        Total Neto: 
                                                        </strong>
                                                    </td>
                                                    <td>$ {{ total=calculartotal }}</td>
                                                </tr>
                                            </tbody>
                                            <tbody v-else>
                                                <tr>
                                                    <td colspan="4">
                                                        No hay articlos agregados
                                                    </td>
                                                </tr>
                                                
                                            </tbody>
                                        </table>
                                        
                                    </div>
                    
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label for="field-2" class="totalcontrol-label"></label>
                                            <button class="btn btn-danger form-control" @click="ocultarDetalle()">Cerrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            

                        </form>
                    </div>
                </template>
                <!-- fin detalles -->
            </div>
        </div>
    </div>
    <!-- end row -->
    <div id="myModal" @blur="validarIngreso('articulo')" class="modal fade in" :class="{'mostrar' : modal}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" @click="cerrarModal()" aria-hidden="true">×</button>
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                </div>
                <div class="modal-body">
                   <div id="datatable-buttons_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                         <div class="dataTables_filter">
                            <label>
                                <input type="search" v-model="buscarA" v-on:keyup.enter="listarArticulo(buscarA)" class="form-control input-sm" placeholder="" aria-controls="datatable-buttons" >
                                <button type="submit" @click="listarArticulo(buscarA)" class="btn btn-primary"><i class="fa fa-search"></i></button>

                            </label>
                         </div>
                           <div class="table-responsive">
                               <table id="datatable-buttons" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Categoría</th>
                                        <th>Precio Venta</th>
                                        <th>Stock</th>
                                        <th>Codigo</th>
                                        <th>Estado</th>
                                        <th>Accion</th>
                                    </tr>
                                    </thead>


                                    <tbody>
                                    <tr v-for="articulo in arrayArticulos" :key="articulo.id">
                                        <td v-text="articulo.nombre"></td>
                                        <td >{{ articulo.categoria['nombre']}}</td>
                                        <td v-text="articulo.precio_venta"></td>
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
                                         
                                            <button type="button" class="btn btn-sm btn-primary" @click="agregarDetalleModal(articulo)" data-toggle="tooltip" data-placement="top" title="" data-original-title="Editar"><i class="fa fa-check"></i></button>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                           </div>
                    </div>
                </div>
                <!-- /.modal-content -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click="cerrarModal()" >Cerrar</button>
                </div>
            </div><!-- /.modal-dialog -->

        </div>
    </div>
</div>  


</template>

<script>
    
    import vSelect from 'vue-select';

    export default {
        data(){
          return{
            ingreso_id:0,
            idproveedor:0,
            proveedor:'',
            tipo_comprobante:0,
            num_comprobante:'',
            serie_comprobante:'',
            impuesto:0,
            total:'',
            totalimpuesto:0,
            totalparcial:0,
            cantidad:1,
            precio:0,
            arrayIngreso:[],
            arrayProveedor: [],
            arrayDetalle : [],
            arrayArticulo:[],
            arrayArticulos:[],
            arrayDetalleIngreso:[],
            modal: 0,
            listado:1,
            tituloModal:'',
            tipoAccion:0,
            errorIngreso: 0,
            errorMostrarMsjIngreso : [{proveedor:'',impuesto:'',comprobante:'',num_comprobante:'',articulo:''}],
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
            tipo_busqueda:'num_comprobante',
            tipo_busquedaA:'nombre',
            buscarA : '',
            num_entradas:'',
            idarticulo:0,
            codigo:'',
            articulo:''
          }
        },
        components: {
            vSelect
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

            },
            calculartotal:function(){
                var resultado=0;
                for (var i = 0; i < this.arrayDetalle.length; i++) {
                    resultado=resultado+(this.arrayDetalle[i].precio*this.arrayDetalle[i].cantidad);
                    
                }
                
                return resultado;
            },
           
        }
        ,
        mounted() {
            this.listarIngreso(1,this.tipo_busqueda,this.buscar); 


        },
        methods: {
            listarIngreso(page,tipo_busqueda,buscar){
                let me=this;
                var url= 'ingreso?page=' + page + '&tipo_busqueda='+tipo_busqueda +'&buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayIngreso = respuesta.ingresos.data;
                    me.pagination= respuesta.pagination;
                    me.num_entradas='Mostrando de '+me.pagination.current_page+' a '+me.pagination.per_page+' de '+me.pagination.total+' entradas';
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            listarArticulo(buscar){
                let me=this;
                var url= 'articulo/listarArticulo?buscar=' + buscar;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayArticulos = respuesta.articulos.data;
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
                me.listarIngreso(page,tipo_busqueda,buscar);
            },
            registrarIngreso(){
                if (this.validarIngreso('todos')){
                    return;
                }
                
                let me=this;
                axios.post('ingreso/registrar',{
                    'proveedor_id':this.idproveedor.id,
                    'tipo_comprobante':this.tipo_comprobante,
                    'num_comprobante':this.num_comprobante,
                    'serie_comprobante':this.serie_comprobante,
                    'impuesto':this.impuesto,
                    'total':this.total,
                    'data':this.arrayDetalle
                }).then(function (response){
                    me.ocultarDetalle();
                    me.listarIngreso(1,'nombre','');
                    swal("Ingreso Registrado!", {
                        icon: "success",
                    });
                }).catch(function(error){
                    console.log(error);
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
                        this.rol=1;
                        break;
                    case "Vendedor":
                        this.rol=2;
                        break;
                    case "Almacenero":
                        this.rol=3;
                        break;
                    default:
                        break;
                }
                axios.put('user/actualizar',{
                    // 'nombre': this.nombre,
                    // 'id': this.persona_id,
                    // 'tipo_documento':this.tipo_documento,
                    // 'num_documento':this.num_documento,
                    // 'direccion':this.direccion,
                    // 'telefono':this.telefono,
                    // 'email':this.email,
                    // 'rol_id':this.rol,
                    // 'usuario':this.usuario
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarPersona(1,'','');
                }).catch(function (error) {
                    console.log(error);
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
            selectProveedor(search,loading){
                let me=this;
                loading(true)

                var url= 'proveedor/selectProveedor?filtro='+search;
                axios.get(url).then(function (response) {
                    let respuesta = response.data;
                    q: search
                    me.arrayProveedor=respuesta.proveedores;
                    loading(false)
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            buscarArticulo(){
                let me=this;
                var url= 'articulo/buscarArticulo?filtro='+me.codigo;
                axios.get(url).then(function (response) {
                    let respuesta = response.data;

                    me.arrayArticulo=respuesta.articulos;

                    if (me.arrayArticulo.length>0) {
                        me.articulo=me.arrayArticulo[0]['nombre'];
                        me.idarticulo=me.arrayArticulo[0]['id'];
                    }else{
                        me.articulo='No existe articulo';
                        me.idarticulo=0;
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            validarIngreso(tipo){
                this.errorIngreso=0;
                
                    switch (tipo) {
                        case "proveedor":
                            if (this.idproveedor==0||!this.idproveedor){
                                this.errorMostrarMsjIngreso[0].proveedor="Seleccione Proveedor"

                            }else{

                                this.errorMostrarMsjIngreso[0].proveedor="";
                            }
                            break;
                        case "impuesto":
                           if (this.impuesto<0){
                                this.errorMostrarMsjIngreso[0].impuesto="Seleccione Impuesto"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].impuesto="";
                            }
                            break;
                        case "comprobante":
                            if (!this.tipo_comprobante){
                                this.errorMostrarMsjIngreso[0].comprobante="Seleccione El tipo de comprobante"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].comprobante="";
                            }

                            break;
                        case "num_comprobante":
                            if (!this.num_comprobante){
                                this.errorMostrarMsjIngreso[0].num_comprobante="Seleccione el numero de comprobante"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].num_comprobante="";
                            }

                            break;
                        case "articulo":
                            if (this.arrayDetalle.length==0){
                                this.errorMostrarMsjIngreso[0].articulo="Sin articulos"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].articulo="";
                            }
                            break;
                        case "todos":
                            if (this.idproveedor==0||!this.idproveedor){
                                this.errorMostrarMsjIngreso[0].proveedor="Seleccione Proveedor"

                            }else{

                                this.errorMostrarMsjIngreso[0].proveedor="";
                            }

                            if (this.impuesto<0){
                                this.errorMostrarMsjIngreso[0].impuesto="Seleccione Impuesto"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].impuesto="";
                            }

                            if (!this.tipo_comprobante){
                                this.errorMostrarMsjIngreso[0].comprobante="Seleccione El tipo de comprobante"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].comprobante="";
                            }

                            if (!this.num_comprobante){
                                this.errorMostrarMsjIngreso[0].num_comprobante="Seleccione el numero de comprobante"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].num_comprobante="";
                            }

                            if (this.arrayDetalle.length==0){
                                this.errorMostrarMsjIngreso[0].articulo="Sin articulos"
                            }else{
                                
                                this.errorMostrarMsjIngreso[0].articulo="";
                            }
                            break;
                    }

                if (this.errorMostrarMsjIngreso[0].proveedor=="" && this.errorMostrarMsjIngreso[0].impuesto=="" && this.errorMostrarMsjIngreso[0].comprobante=="" && this.errorMostrarMsjIngreso[0].articulo=="" ){
                             this.errorIngreso = 0;
                }else{
                    this.errorIngreso=1;
                }
                    
                return this.errorIngreso;
            },
            encuentra(id){
                var sw=0;
                for (var i =0;i< this.arrayDetalle.length ; i++) {
                    if (this.arrayDetalle[i].idarticulo==id) {
                        sw=true;
                    }
                }
                return sw;
            },
            agregarDetalle(){
                let me=this;
                if (me.idarticulo==0 || me.cantidad==0 || me.precio==0) {
                    
                }else{
                    if (me.encuentra(me.idarticulo)) {
                        swal("El Articulo Ya Esta Agregado!", {
                          type: 'error',
                          title:'Error',
                          icon: "error",
                        });
                    }else{
                        me.arrayDetalle.push({
                            idarticulo:me.idarticulo,
                            articulo:me.articulo,
                            cantidad:me.cantidad,
                            precio:me.precio
                        });
                        me.idarticulo=0;
                        me.codigo='';
                        me.articulo=0;
                        me.cantidad=1;
                        me.precio=0;
                    }
                    
                }
                
            },
            agregarDetalleModal(data=[]){
                let me=this;
                if (me.encuentra(data['id'])) {
                        swal("El Articulo Ya Esta Agregado!", {
                          type: 'error',
                          title:'Error',
                          icon: "error",
                        });
                    }else{
                        me.arrayDetalle.push({
                            idarticulo:data['id'],
                            articulo:data['nombre'],
                            cantidad:1,
                            precio:0
                        });
                    }

            },
            eliminarDetalle(index){
                let me=this;
                me.arrayDetalle.splice(index,1);
            },
            mostrarDetalle(){
                this.listado=0;
            },
            ocultarDetalle(){
                this.listado=1;
                this.idarticulo=0;
                this.idproveedor=[];
                this.arrayDetalle=[];
                this.arrayDetalleIngreso=[]; 
                this.tipo_comprobante=0;
                this.num_comprobante='';
                this.serie_comprobante='';
                this.impuesto=0;
                this.total='';
                this.proveedor='';
                this.codigo='';
                this.articulo=0;
                this.cantidad=1;
                this.precio=0;
                this.errorIngreso=0;
                this.errorMostrarMsjIngreso = [{proveedor:'',impuesto:'',comprobante:'',num_comprobante:'',articulo:''}];
            },
            verIngreso(ingreso=[]){
                this.listado=2;
                let me=this;
                me.arrayDetalleIngreso = ingreso;
                me.proveedor = me.arrayDetalleIngreso.proveedor.contacto;
                me.impuesto=me.arrayDetalleIngreso.impuesto;
                me.tipo_comprobante=me.arrayDetalleIngreso.tipo_comprobante;
                me.serie_comprobante=me.arrayDetalleIngreso.serie_comprobante;
                me.num_comprobante=me.arrayDetalleIngreso.num_comprobante;
                me.arrayDetalle=me.arrayDetalleIngreso.detalle_ingreso;
            },
            cerrarModal(){
                $('#myModal').modal('hide');
                this.tituloModal='';
                this.buscarA='';
                this.validarIngreso('articulo');
            },
            abrirModal(){
                $('#myModal').modal('show');
                this.listarArticulo('');
                this.tituloModal = 'Seleccione el articulo';
            },
            formatNumber(n){
                n = Math.trunc(n);
                n = String(n).replace(/\D/g, "");
                return (n === '' ? n : Number(n).toLocaleString())
                // return n === '' ? n : Number(n).toLocaleString();
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
        color: #d57171!important;
        width: 100%;
    }
</style>

